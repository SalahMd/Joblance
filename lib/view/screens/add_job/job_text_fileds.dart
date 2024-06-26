import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_job_controller.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/text_styles.dart';

class JobTextFileds extends StatelessWidget {
  final AddjobControllerImpl controller;
  const JobTextFileds({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w),
          child: Text(
            "jobtitle".tr,
            style: TextStyles.w50014(context),
          ),
        ).animate().fade(duration: 600.ms, delay: 200.ms).slideY(begin: 0.4),
        Customtextformfiled(
          hintText: "jobtitle2".tr,
          labelText: "".tr,
          iconData: null,
          controller: controller.jobTitle,
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
            "joblocation".tr,
            style: TextStyles.w50014(context),
          ),
        ).animate().fade(duration: 600.ms, delay: 400.ms).slideY(begin: 0.4),
        Customtextformfiled(
          hintText: "joblocation2".tr,
          labelText: "".tr,
          iconData: null,
          controller: controller.jobLocation,
          min: 4,
          max: 25,
          isNumber: false,
          isPassword: false,
          isValidation: false,
          isBorder: false,
          isLabel: false,
          isFilled: true,
        ).animate().fade(duration: 600.ms, delay: 400.ms).slideY(begin: 0.4),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
          child: Text(
            "aboutjob1".tr,
            style: TextStyles.w50014(context),
          ),
        ).animate().fade(duration: 600.ms).slideY(begin: 0.4),
        Customtextformfiled(
          hintText: "aboutjob2".tr,
          labelText: "",
          iconData: null,
          controller: controller.aboutJob,
          min: 10,
          max: 300,
          isNumber: false,
          isPassword: false,
          isBorder: false,
          maxLines: 4,
          isLabel: false,
          textInputAction: TextInputAction.newline,
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
            "jobadditionalinfo".tr,
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
          isValidation: false,
          textInputAction: TextInputAction.newline,
          isBorder: false,
          maxLines: 4,
          isLabel: false,
          isFilled: true,
        ).animate().fade(duration: 600.ms, delay: 900.ms).slideY(begin: 0.4),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
          child: Text(
            "salary".tr,
            style: TextStyles.w50014(context),
          ),
        ).animate().fade(duration: 600.ms, delay: 600.ms).slideY(begin: 0.4),
        Customtextformfiled(
          hintText: "salary".tr,
          labelText: "salary".tr,
          iconData: null,
          controller: controller.salary,
          min: 1,
          max: 5,
          isValidation: false,
          isNumber: true,
          isPassword: false,
          isBorder: false,
          textInputAction: TextInputAction.newline,
          maxLines: 1,
          isLabel: false,
          isFilled: true,
        ).animate().fade(duration: 600.ms, delay: 700.ms).slideY(begin: 0.4),
      ],
    );
  }
}
