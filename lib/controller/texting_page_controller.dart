import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class TextingPageController extends GetxController {
  sendMessage();
  showEmojie();
}

class TextingPageControllerImpl extends TextingPageController {
  List messages = [];
  late TextEditingController message;
  bool showEmojes = false;

  @override
  void onInit() {
    message = new TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }

  @override
  sendMessage() {
    if (message.text != "") messages.add(message.text);
    message.clear();
    update();
  }

  showEmojie() {
    showEmojes = !showEmojes;
    update();
  }

  pickEmojo() {
    update();
  }
}
