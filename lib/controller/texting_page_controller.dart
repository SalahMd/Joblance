import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class TextingPageController extends GetxController {
  sendMessage();
  showEmojie();
}

class TextingPageControllerImpl extends TextingPageController {
  List messages = [];
  int line = 1;
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
}
