import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joblance/core/laravel_echo/laravel_echo.dart';
import 'package:joblance/data/model/chat_model.dart';
import 'package:pusher_client/pusher_client.dart';

abstract class TextingPageController extends GetxController {
  sendMessage();
  showEmojie();
  pickImage();
}

class TextingPageControllerImpl extends TextingPageController {
  List<Map<dynamic, dynamic>> messages = [];
  int line = 1;
  var image;
  late TextEditingController message;
  bool showEmojes = false;
  TextDirection textDirection = TextDirection.ltr;
  FocusNode focusNode = new FocusNode();
  final ScrollController scrollController = new ScrollController();
  @override
  void onInit() {
    message = new TextEditingController();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        Future.delayed(Duration(milliseconds: 500), () => scrollDown());
      }
    });
    message.addListener(() {
      updateTextDirection();
    });
    listenChatChannel(ChatModel());
    super.onInit();
  }

  scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 800), curve: Curves.easeOutQuint);
  }

  @override
  Future<void> pickImage() async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      print(pickedImage.path);
      image = File(pickedImage.path);
      messages.add({
        "image": image.path,
      });
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
  sendMessage() {
    if (message.text != "") messages.add({"message": message.text});
    message.clear();
    scrollDown();
    //final result =
    update();
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
