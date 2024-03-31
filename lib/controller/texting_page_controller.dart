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
    super.onInit();
  }

  scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 800), curve: Curves.easeOutQuint);
  }

  @override
  void dispose() {
    message.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  sendMessage() {
    if (message.text != "") messages.add(message.text);
    message.clear();
    scrollDown();
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
