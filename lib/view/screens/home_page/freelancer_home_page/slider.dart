import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class SliderWidget extends StatelessWidget {
  final String companyImage;
  final String companyName;
  final String applicants;
  final String jobTitle;
  final String remote;
  const SliderWidget(
      {super.key,
      required this.companyImage,
      required this.companyName,
      required this.applicants,
      required this.jobTitle,
      required this.remote});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // width: Dimensions.screenwidth(context),
          // height: 185.h,
          alignment: AlignmentDirectional.centerEnd,
          padding:
              EdgeInsetsDirectional.only(end: 10.w, top: 15.h, bottom: 7.h),
          margin: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 15.w,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey[800]!,
                spreadRadius: 0.5,
                blurRadius: 0.5,
                offset: const Offset(0.5, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(249, 28, 29, 48),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 22.w,
                height: 22.h,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Image.asset(
                  AppImages.save,
                  fit: BoxFit.fill,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_right_rounded,
                size: 50,
                color: LightAppColors.greyColor,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 20,
                    color: LightAppColors.primaryColor,
                  ),
                  Text("United states" + " - " + remote,
                      style: TextStyles.w50011White),
                ],
              )
            ],
          ),
        ),
        Container(
                  width: Dimensions.screenwidth(context) / 1.55,
                  margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  padding: EdgeInsetsDirectional.only(start: 6.w, top: 12.h),
                  decoration: BoxDecoration(
          color: LightAppColors.primaryColor.withOpacity(0.7),
          borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(230),
              topStart: Radius.circular(22),
              bottomStart: Radius.circular(22))),
                  child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  width: 35.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(companyImage))),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jobTitle,
                    style: TextStyles.w50016White,
                  ),
                  Text(
                    companyName,
                    style: TextStyles.w50016White,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Icon(
                Icons.person_outline,
                size: 20,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                applicants + "applicants".tr,
                style: TextStyles.w50011White,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(
                Icons.calendar_month_outlined,
                size: 20,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "12" + " hours ago".tr,
                style: TextStyles.w50011White,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(
                Icons.attach_money_outlined,
                size: 20,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "45k - 60k".tr,
                style: TextStyles.w50011White,
              ),
            ],
          ),
        ],
                  ),
                ),
      ],
    );
  }
}
