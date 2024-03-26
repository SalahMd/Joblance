import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_job_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/add_job/job_drop_down.dart';

class JobSpecifications extends StatelessWidget {
  final AddjobControllerImpl controller;
  const JobSpecifications({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
        ),
        Container(
          margin: EdgeInsetsDirectional.only(
            start: 15.w,
          ),
          child: Text(
            "jobtype".tr,
            style: TextStyles.w50014(context),
          ),
        ),
        JobDropDown(
            title: "jobtype",
            choices: controller.jobType,
            elementValue: controller.jobTypeValue,
            controller: controller),
        SizedBox(
          height: 15.h,
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 15.w),
          child: Text(
            "jobexperince".tr,
            style: TextStyles.w50014(context),
          ),
        ),
        JobDropDown(
            title: "jobexperince",
            choices: controller.jobExperience,
            elementValue: controller.jobExpirenceValue,
            controller: controller),
        SizedBox(
          height: 15.h,
        ),
        Container(
          margin: EdgeInsetsDirectional.only(
            start: 15.w,
          ),
          child: Text(
            "remote".tr,
            style: TextStyles.w50014(context),
          ),
        ),
        JobDropDown(
            title: "remote",
            choices: controller.remote,
            elementValue: controller.remoteValue,
            controller: controller),
        SizedBox(
          height: 15.h,
        ),
        Container(
          margin: EdgeInsetsDirectional.only(
            start: 15.w,
          ),
          child: Text(
            "major".tr,
            style: TextStyles.w50014(context),
          ),
        ),
        JobDropDown(
            title: "major",
            choices: controller.major,
            elementValue: controller.majorValue,
            controller: controller),
      ],
    );
  }
}
