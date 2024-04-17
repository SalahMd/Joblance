import 'dart:convert';
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
import 'package:pusher_client/pusher_client.dart';

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
  MessagesBack sendMessageBack = new MessagesBack(Get.put(Crud()));
  bool showEmojes = false;
  TextDirection textDirection = TextDirection.ltr;
  FocusNode focusNode = new FocusNode();
  ScrollController scrollController = new ScrollController();
  TextingPageControllerImpl({
    required this.id,
    required this.userId,
  });
  @override
  void onInit() async {
    message = new TextEditingController();
    token = myServices.sharedPreferences.getString("token")!;
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
                timeStamp: Jiffy.parse(messageData['date']).Hm.toString(),
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
    scrollDown();

    // listenChatChannel(ChatModel());
    super.onInit();
  }

  readMessages() async {
    var response = await sendMessageBack.readMessages(token, id);
    statusRequest = hadelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("success");
      }
    }
  }

  scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeOutQuint);
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
        timeStamp: Jiffy.now().Hm.toString(),
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
    super.dispose();
  }

  @override
  sendMessage() async {
    var response;
    if (messages.length != 0) {
      response = await sendMessageBack
          .sendMessage(token, {"conversation_id": id, "text": message.text});
    } else {
      response = await sendMessageBack
          .sendMessage(token, {"user_id": userId, "text": message.text});
    }

    statusRequest = hadelingData(response);
    if (message.text != "")
      messages.add(MessageModel(
        reciverId: reciverId,
        senderId: reciverId,
        id: {messages.length + 1}.toString(),
        type: "text",
        message: message.text,
        timeStamp: Jiffy.now().Hm.toString(),
      ));
    message.clear();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("success///////////////");
      }
    }
    update();
    Future.delayed(
        Duration(
          milliseconds: 500,
        ), () {
      scrollDown();
    });
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

  void listenChatChannel(ChatModel chat) {
    LaravelEcho.instance.private('chat.${chat.id}').listen('.message.sent',
        (e) {
      if (e is PusherEvent) {
        if (e.data != null) {
          jsonDecode(e.data!);
          handleNewMessage(jsonDecode(e.data!));
        }
      }
    }).error((err) {});
  }

  void leaveChatChannel(ChatModel chat) {
    try {
      LaravelEcho.instance.leave('chat.${chat.id}');
    } catch (e) {}
  }

  void handleNewMessage(
    Map<String, dynamic> data,
  ) {
    messages.add(data['message']['']);
    update();
  }
}
