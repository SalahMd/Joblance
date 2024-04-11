import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/texting_page_controller.dart';

class ChatTextField extends StatelessWidget {
  final TextingPageControllerImpl controller;
  const ChatTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextFormField(
          textDirection: controller.textDirection,
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          focusNode: controller.focusNode,
          textInputAction: TextInputAction.newline,
          minLines: 1,
          controller: controller.message,
          maxLines: 3,
          decoration: InputDecoration(
            enabled: true,
            hintText: "message".tr,
            hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            border: InputBorder.none,
          ),
        ));
  }
}
