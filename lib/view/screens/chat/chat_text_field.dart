import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/texting_page_controller.dart';
import 'package:joblance/core/constants/colors.dart';

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
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.uploadFile();
                  },
                  child: Container(
                    padding: EdgeInsetsDirectional.only(end: 10.w),
                    child: Icon(
                      Icons.attach_file_outlined,
                      color: LightAppColors.greyColor,
                      size: 21.sp,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: Container(
                    padding: EdgeInsetsDirectional.only(end: 10.w),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: LightAppColors.greyColor,
                      size: 21.sp,
                    ),
                  ),
                ),
              ],
            ),
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
