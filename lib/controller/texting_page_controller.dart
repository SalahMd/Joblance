import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class TextingPageController extends GetxController {
  sendMessage();
}

class TextingPageControllerImpl extends TextingPageController {
  List messages = [];
  late TextEditingController message;

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
    messages.add(message.text);
    message.clear();
    update();
  }
}
