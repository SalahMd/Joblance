import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_task_controller.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/text_styles.dart';

class TaskTextFields extends StatelessWidget {
  final AddTaskControllerImpl controller;
  const TaskTextFields({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w),
          child: Text(
            "tasktitle".tr,
            style: TextStyles.w50014(context),
          ),
        ).animate().fade(duration: 600.ms, delay: 200.ms).slideY(begin: 0.4),
        Customtextformfiled(
          hintText: "tasktitle2".tr,
          labelText: "".tr,
          iconData: null,
          controller: controller.taskTitle,
          min: 5,
          max: 20,
          isNumber: false,
          isPassword: false,
          isBorder: false,
          isLabel: false,
          isFilled: true,
        ).animate().fade(duration: 600.ms, delay: 300.ms).slideY(begin: 0.4),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
          child: Text(
            "abouttask1".tr,
            style: TextStyles.w50014(context),
          ),
        ).animate().fade(duration: 600.ms).slideY(begin: 0.4),
        Customtextformfiled(
          hintText: "abouttask2".tr,
          labelText: "",
          iconData: null,
          controller: controller.aboutTask,
          min: 10,
          max: 300,
          isNumber: false,
          textInputAction: TextInputAction.newline,
          isPassword: false,
          isBorder: false,
          maxLines: 4,
          isLabel: false,
          isFilled: true,
        ).animate().fade(duration: 600.ms, delay: 500.ms).slideY(begin: 0.4),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
          child: Text(
            "requirements".tr,
            style: TextStyles.w50014(context),
          ),
        ).animate().fade(duration: 600.ms, delay: 600.ms).slideY(begin: 0.4),
        Customtextformfiled(
          hintText: "requirements2".tr,
          labelText: "requirements2".tr,
          iconData: null,
          controller: controller.requirements,
          min: 10,
          max: 300,
          isNumber: false,
          isPassword: false,
          isBorder: false,
          textInputAction: TextInputAction.newline,
          maxLines: 4,
          isLabel: false,
          isFilled: true,
        ).animate().fade(duration: 600.ms, delay: 700.ms).slideY(begin: 0.4),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
          child: Text(
            "taskadditionalinfo".tr,
            style: TextStyles.w50014(context),
          ),
        ).animate().fade(duration: 600.ms, delay: 800.ms).slideY(begin: 0.4),
        Customtextformfiled(
          hintText: "additionalinfo2".tr,
          labelText: "".tr,
          iconData: null,
          controller: controller.additionalInfo,
          min: 10,
          max: 300,
          isNumber: false,
          isPassword: false,
          isBorder: false,
          maxLines: 4,
          textInputAction: TextInputAction.newline,
          isLabel: false,
          isFilled: true,
        ).animate().fade(duration: 600.ms, delay: 900.ms).slideY(begin: 0.4),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
          child: Text(
            "taskduration".tr,
            style: TextStyles.w50014(context),
          ),
        ).animate().fade(duration: 600.ms, delay: 800.ms).slideY(begin: 0.4),
        Row(
          children: [
            Expanded(
                flex: 3,
                child: Customtextformfiled(
                  hintText: "taskduration2".tr,
                  labelText: "".tr,
                  iconData: null,
                  controller: controller.taskDuration,
                  min: 1,
                  max: 3,
                  isNumber: true,
                  isPassword: false,
                  isBorder: false,
                  isLabel: false,
                  isFilled: true,
                )),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: 12.h, start: 10.w),
                child: Text(
                  "days".tr,
                  style: TextStyles.w50014(context),
                ),
              ),
            ),
          ],
        ).animate().fade(duration: 600.ms, delay: 900.ms).slideY(begin: 0.4),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
          child: Text(
            "budget".tr,
            style: TextStyles.w50014(context),
          ),
        ).animate().fade(duration: 600.ms, delay: 1000.ms).slideY(begin: 0.4),
        Row(
          children: [
            Expanded(
              child: Customtextformfiled(
                hintText: "min".tr,
                labelText: "".tr,
                iconData: null,
                controller: controller.minBudget,
                min: 1,
                max: 6,
                isNumber: true,
                isPassword: false,
                isBorder: false,
                isLabel: false,
                isFilled: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Icon(
                Icons.arrow_right_alt,
                size: 25.sp,
              ),
            ),
            Expanded(
              child: Customtextformfiled(
                hintText: "max".tr,
                labelText: "".tr,
                iconData: null,
                controller: controller.maxBudget,
                min: 1,
                max: 6,
                isNumber: true,
                isPassword: false,
                isBorder: false,
                isLabel: false,
                isFilled: true,
              ),
            )
          ],
        )
      ],
    );
  }
}
