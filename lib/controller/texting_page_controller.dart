import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/laravel_echo/laravel_echo.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/chat_model.dart';
import 'package:joblance/data/model/message_model.dart';
import 'package:joblance/data/remote/chat/messages_back.dart';
import 'package:laravel_flutter_pusher/laravel_flutter_pusher.dart';

abstract class TextingPageController extends GetxController {
  sendMessage();
  showEmojie();
  pickImage();
}

class TextingPageControllerImpl extends TextingPageController {
  final String id;
  final String userId;
  List<MessageModel> messages = [];
  int line = 1;
  late String reciverId;
  late String messageId;
  var image;
  late String token;
  late TextEditingController message;
  Myservices myServices = Get.find();
  StatusRequest? statusRequest;
  late LaravelFlutterPusher pusher;
  MessagesBack sendMessageBack = new MessagesBack(Get.put(Crud()));
  bool showEmojes = false;
  TextDirection textDirection = TextDirection.ltr;
  FocusNode focusNode = new FocusNode();
  ScrollController scrollController = new ScrollController();
  bool isMaxPosition = false;
  TextingPageControllerImpl({
    required this.id,
    required this.userId,
  });
  @override
  void onInit() async {
    message = new TextEditingController();
    token = myServices.sharedPreferences.getString("token")!;

    addListener(() {
      listenChatChannel();
    });
    statusRequest = StatusRequest.loading;
    reciverId = myServices.sharedPreferences.getInt('id').toString();
    var response = await sendMessageBack.getMessages(token, id);
    statusRequest = hadelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        readMessages();
        for (int i = 0; i < response['data'].length; i++) {
          var messageData = response['data'][i];
          if (messageData != null &&
              messageData is Map &&
              messageData.containsKey('type') &&
              messageData.containsKey('body')) {
            messages.add(MessageModel(
                id: messageData['id'].toString(),
                message: messageData['body'],
                timeStamp: Jiffy.parse(messageData['date'])
                    .format(pattern: "h:mm a")
                    .toString(),
                type: messageData['type'],
                senderId: messageData['user_id'].toString(),
                reciverId: reciverId));
          }
        }
        messages = messages.reversed.toList();
      }
    }
    update();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        Future.delayed(Duration(milliseconds: 500), () => scrollDown());
      }
    });
    message.addListener(() {
      updateTextDirection();
    });
    // scrollController.addListener(() {
    //   checkScroll();
    // });
    super.onInit();
  }

  checkScroll() {
    if (scrollController.position.pixels <
        scrollController.position.maxScrollExtent - 200) {
      isMaxPosition = false;
    } else {
      isMaxPosition = true;
    }

    update();
  }

  void listenChatChannel() {
    // var options = PusherOptions(
    //   auth: PusherAuth(
    //     PusherConfig.hostAuthEndPoint,
    //     headers: {'Authorization': "Bearer $token"},
    //   ),
    //   host: PusherConfig.hostEndPoint,
    //   port: PusherConfig.port,
    //   encrypted: true,
    //   cluster: PusherConfig.cluster,
    // );
    
    LaravelEcho.init(token: token);
    LaravelEcho.instance
        .private("Messenger.$id")
        .listen("MessageSent", (e) => print(e));

    // pusher = LaravelFlutterPusher("21fe88719842ee7606a5", options,
    //     onError: (ConnectionError) {
    //   print("Error: $ConnectionError");
    // }, enableLogging: false);
    // // await pusher.subscribe('Messenger.$id').bind("App\\Events\\MessageSent",
    // //     (event) => print("My event/////////////////////" + event.toString()));
    // createEcho(id, pusher, token, options);
    // pusher.connect();
  }

  readMessages() async {
    var response = await sendMessageBack.readMessages(token, id);
    statusRequest = hadelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {}
    }
  }

  scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeOutQuint);
    isMaxPosition = true;
  }

  @override
  Future<void> pickImage() async {
    var response;
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      print(image.path);
      if (messages.length != 0) {
        response = await sendMessageBack.sendImage(
            token,
            {
              "conversation_id": id,
            },
            image);
      } else {
        response = await sendMessageBack.sendImage(
            token,
            {
              "user_id": userId,
            },
            image);
      }
      statusRequest = hadelingData(response);
      messages.add(MessageModel(
        reciverId: reciverId,
        senderId: reciverId,
        id: {messages.length + 1}.toString(),
        type: "image",
        message: image,
        timeStamp: Jiffy.now().format(pattern: "h:mm a").toString(),
      ));
      scrollDown();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          print("success///////////////");
        }
      }
    } else {
      print("Image picking canceled");
    }
    update();
  }

  @override
  void dispose() {
    message.dispose();
    focusNode.dispose();
    pusher.unsubscribe("Messenger.${id}");
    pusher.disconnect();
    super.dispose();
  }

  @override
  sendMessage() async {
    if (message.text != "") {
      messages.add(MessageModel(
          reciverId: reciverId,
          senderId: reciverId,
          id: {messages.length + 1}.toString(),
          type: "text",
          message: message.text,
          timeStamp: Jiffy.now().format(pattern: "h:mm a").toString()));
      scrollDown();
      message.clear();
      var response;
      if (messages.length != 0) {
        response = await sendMessageBack.sendMessage(
            token, {"conversation_id": id, "text": messages.last.message});
      } else {
        response = await sendMessageBack.sendMessage(
            token, {"user_id": userId, "text": messages.last.message});
      }
      statusRequest = hadelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {}
      }
      update();
    }
  }

  showEmojie() {
    showEmojes = !showEmojes;
    update();
  }

  pickEmojo() {
    update();
  }

  void updateTextDirection() {
    final text = message.text;
    if (text.length > 1) return;
    if (text.isNotEmpty &&
        text.codeUnitAt(0) > 0x600 &&
        text.codeUnitAt(0) < 0x6FF) {
      textDirection = TextDirection.rtl;
    } else {
      textDirection = TextDirection.ltr;
    }
    update();
  }

  void leaveChatChannel(ChatModel chat) {}

  void handleNewMessage(
    Map<String, dynamic> data,
  ) {
    messages.add(data['message']['']);
    update();
  }
}
