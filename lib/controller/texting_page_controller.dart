import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/sounds.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/laravel_echo/laravel_echo.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/chat_model.dart';
import 'package:joblance/data/model/message_model.dart';
import 'package:joblance/data/remote/chat/messages_back.dart';
import 'package:joblance/view/screens/chat/confirm_sending_file.dart';
import 'package:laravel_flutter_pusher/laravel_flutter_pusher.dart';
import 'package:soundpool/soundpool.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_client/web_socket_client.dart';

abstract class TextingPageController extends GetxController {
  sendMessage();
  showEmojie();
  pickImage();
}

class TextingPageControllerImpl extends TextingPageController {
  final String id, userId;
  List<MessageModel> messages = [];
  List<bool> selectedMessage = [];
  int line = 1;
  late String reciverId, token;
  var image, file;
  String? fileName;
  late TextEditingController message;
  Myservices myServices = Get.find();
  StatusRequest? statusRequest;
  FilePickerResult? result;
  late LaravelFlutterPusher pusher;
  MessagesBack sendMessageBack = new MessagesBack(Get.put(Crud()));
  bool showEmojes = false, isMaxPosition = false, isDelete = false;
  TextDirection textDirection = TextDirection.ltr;
  FocusNode focusNode = new FocusNode();
  ScrollController scrollController = new ScrollController();
  late int soundId;
  Soundpool pool = Soundpool(streamType: StreamType.notification);
  TextingPageControllerImpl({
    required this.id,
    required this.userId,
  });
  @override
  void onInit() async {
    print(PusherConfig.hostEndPoint);
    message = new TextEditingController();
    token = myServices.sharedPreferences.getString("token")!;
    soundId =
        await rootBundle.load(AppSounds.messageSent).then((ByteData soundData) {
      return pool.load(soundData);
    });
    addListener(() async {
      listenChatChannel();
    });

    statusRequest = StatusRequest.loading;
    reciverId = myServices.sharedPreferences.getInt('id').toString();
    var response = await sendMessageBack.getMessages(token, id);
    statusRequest = handelingData(response);
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
                fileName: messageData['type'] == "file"
                    ? messageData['file_name']
                    : null,
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
    selectedMessage = List.generate(messages.length, (index) => false);
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
    var options = PusherOptions(
      auth: PusherAuth(
        PusherConfig.hostAuthEndPoint,
        headers: {'Authorization': "Bearer $token"},
      ),
      host: PusherConfig.hostEndPoint,
      port: PusherConfig.port,
      encrypted: true,
      cluster: PusherConfig.cluster,
    );
    LaravelEcho.init(token: token);
    LaravelEcho.instance
        .private("Messenger.$id")
        .listen("MessageSent", (e) => print(e));

    pusher = LaravelFlutterPusher("21fe88719842ee7606a5", options,
        onError: (ConnectionError) {
      print("Error: $ConnectionError");
    }, enableLogging: true);
    pusher.connect();

    // pusher.subscribe('Messenger.$id').bind("App\\Events\\MessageSent",
    //     (event) => print("My event/////////////////////" + event.toString()));

    createEcho(id, pusher, token, options);
  }

  readMessages() async {
    var response = await sendMessageBack.readMessages(token, id);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {}
    }
  }

  scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent + 50,
        duration: Duration(milliseconds: 300), curve: Curves.easeOutQuint);
    isMaxPosition = true;
  }

  uploadFile() async {
    result = await FilePicker.platform.pickFiles(
        allowedExtensions: ["pdf", "txt", "docx", "doc"],
        type: FileType.custom);
    if (result != null) {
      file = File(result!.files.single.path!);
      fileName = result!.files.single.name;
      Get.to(ConfirmSendingFile());
    } else {}
  }

  sendFile() async {
    var response;
    if (file != null) {
      if (messages.length != 0) {
        response = await sendMessageBack.sendFile(
            token,
            {
              "conversation_id": id,
            },
            file,
            "file");
      } else {
        response = await sendMessageBack.sendFile(
            token,
            {
              "user_id": userId,
            },
            file,
            "file");
      }
      statusRequest = handelingData(response);
      selectedMessage.add(false);

      messages.add(MessageModel(
        reciverId: reciverId,
        senderId: reciverId,
        id: {messages.length + 1}.toString(),
        type: "file",
        message: file,
        fileName: fileName,
        timeStamp: Jiffy.now().format(pattern: "h:mm a").toString(),
      ));
      scrollDown();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          popSound();
          print("success///////////////");
        }
      }
    }
    update();

    Get.back();
  }

  deleteMessage(BuildContext context) async {
    late String messageId;
    for (int i = 0; i < messages.length; i++) {
      if (selectedMessage[i] == true) {
        messageId = i.toString();
        break;
      }
    }
    var response = await sendMessageBack.deleteMessage(token, messageId, "me");
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("success///////////////");
      }
    }
  }

  downloadFile(String url) {
    FileDownloader.downloadFile(
        url: AppLinks.IP + "/" + url,
        name: "file",
        onDownloadCompleted: (String path) {
          print('FILE DOWNLOADED TO PATH: $path');
        },
        onDownloadError: (String error) {
          print('DOWNLOAD ERROR: $error');
        });
  }

  @override
  Future<void> pickImage() async {
    var response;
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      if (messages.length != 0) {
        response = await sendMessageBack.sendFile(
            token,
            {
              "conversation_id": id,
            },
            image,
            "image");
      } else {
        response = await sendMessageBack.sendFile(
            token,
            {
              "user_id": userId,
            },
            image,
            "image");
      }
      statusRequest = handelingData(response);
      selectedMessage.add(false);

      messages.add(MessageModel(
        reciverId: reciverId,
        senderId: reciverId,
        id: {messages.length + 1}.toString(),
        type: "image",
        message: pickedImage.path,
        timeStamp: Jiffy.now().format(pattern: "h:mm a").toString(),
      ));
      scrollDown();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          popSound();
          print("success///////////////");
        }
      }
    } else {
      print("Image picking canceled");
    }
    update();
  }

  popSound() async {
    // ignore: unused_local_variable
    int streamId = await pool.play(soundId);
  }

  @override
  void dispose() {
    message.dispose();
    pusher.disconnect();
    pusher.unsubscribe("Meesenger.$id");
    focusNode.dispose();
    pusher.unsubscribe("Messenger.${id}");
    pusher.disconnect();
    pool.dispose();
    super.dispose();
  }

  @override
  sendMessage() async {
    if (message.text != "") {
      selectedMessage.add(false);

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
      statusRequest = handelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          popSound();
        }
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
