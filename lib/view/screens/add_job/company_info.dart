import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_job_controller.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';

class CompanyInfo extends StatelessWidget {
  final AddjobControllerImpl controller;
  const CompanyInfo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
          child: Text(
            "companyinfo".tr,
            style: TextStyles.w50014(context),
          ),
        ).animate().fade(duration: 600.ms, delay: 1300.ms).slideY(begin: 0.3),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: Theme.of(context).colorScheme.onSecondary)),
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          padding: EdgeInsetsDirectional.only(
              start: 20.w, top: 5.h, bottom: 5.h, end: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "shownumofemployees".tr,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
              ),
              Checkbox(
                  activeColor: LightAppColors.greenColor,
                  checkColor: LightAppColors.primaryColor,
                  value: controller.showNumOfEmployees,
                  onChanged: (val) {
                    controller.changeCheckBoxValue("showemployees");
                  }),
            ],
          ),
        ).animate().fade(duration: 600.ms, delay: 1300.ms).slideY(begin: 0.3),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: Theme.of(context).colorScheme.onSecondary)),
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          padding: EdgeInsetsDirectional.only(
              start: 20.w, top: 5.h, bottom: 5.h, end: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "showaboutcompany".tr,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
              ),
              Checkbox(
                  activeColor: LightAppColors.greenColor,
                  checkColor: LightAppColors.primaryColor,
                  value: controller.showAboutCompany,
                  onChanged: (val) {
                    controller.changeCheckBoxValue("aboutcompany");
                  }),
            ],
          ),
        ).animate().fade(duration: 600.ms, delay: 1300.ms).slideY(begin: 0.3),
      ],
    );
  }
}
