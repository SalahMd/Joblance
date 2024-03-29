import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/auth/signup_controller.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class CompanyOrFreeLancer extends StatelessWidget {
  final SignUpControllerImpl controller;
  const CompanyOrFreeLancer({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth(context),
      margin: controller.isGoogleSignin
          ? EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h)
          : EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              if (controller.isFreelancer)
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 115.w, top: 10.h, bottom: 10.h),
                  child: GestureDetector(
                    onTap: () {
                      controller.changeState(false);
                    },
                    child: Container(
                      width: Dimensions.screenWidth(context) / 2.3,
                      height: 45.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        "company".tr,
                        style: TextStyles.w50013(context),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              GestureDetector(
                onTap: () {
                  controller.changeState(true);
                },
                child: Container(
                  width: Dimensions.screenWidth(context) / 2.5,
                  height: 45.h,
                  alignment: Alignment.center,
                  margin: EdgeInsetsDirectional.only(
                    start: 15.w,
                    top: 10.h,
                    bottom: 10.h,
                  ),
                  padding: EdgeInsetsDirectional.only(end: 7.w),
                  decoration: BoxDecoration(
                    color: controller.isFreelancer
                        ? LightAppColors.primaryColor
                        : Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Text(
                    "freelancer".tr,
                    style: !controller.isFreelancer
                        ? TextStyles.w50013(context)
                        : TextStyles.w50013White(context),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              if (!controller.isFreelancer)
                GestureDetector(
                  onTap: () {
                    controller.changeState(false);
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 115.w, top: 10.h, bottom: 10.h),
                    child: Container(
                      width: Dimensions.screenWidth(context) / 2.3,
                      height: 45.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: !controller.isFreelancer
                              ? LightAppColors.primaryColor
                              : Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        "company".tr,
                        style: TextStyles.w50013White(context),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
