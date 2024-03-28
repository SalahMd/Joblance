import 'package:flutter/material.dart';
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
        ),
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
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
          child: Text(
            "joblocation".tr,
            style: TextStyles.w50014(context),
          ),
        ),
        Customtextformfiled(
          hintText: "joblocation2".tr,
          labelText: "".tr,
          iconData: null,
          controller: controller.jobLocation,
          min: 4,
          max: 25,
          isNumber: false,
          isPassword: false,
          isBorder: false,
          isLabel: false,
          isFilled: true,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
          child: Text(
            "aboutjob1".tr,
            style: TextStyles.w50014(context),
          ),
        ),
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
          isFilled: true,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
          child: Text(
            "requirements".tr,
            style: TextStyles.w50014(context),
          ),
        ),
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
          maxLines: 4,
          isLabel: false,
          isFilled: true,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
          child: Text(
            "jobadditionalinfo".tr,
            style: TextStyles.w50014(context),
          ),
        ),
        Customtextformfiled(
          hintText: "additionalinfo2".tr,
          labelText: "".tr,
          iconData: null,
          controller: controller.requirements,
          min: 10,
          max: 300,
          isNumber: false,
          isPassword: false,
          isBorder: false,
          maxLines: 4,
          isLabel: false,
          isFilled: true,
        ),
      ],
    );
  }
}
