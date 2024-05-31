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
          alignment: AlignmentDirectional.centerEnd,
          padding: EdgeInsetsDirectional.only(end: 10.w, top: 10, bottom: 6),
          margin: EdgeInsets.symmetric(
            vertical: 20,
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
                width: 20.w,
                height: 20,
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
                    size: 16.sp,
                    color: LightAppColors.primaryColor,
                  ),
                  Text("United states" + " - " + remote,
                      style: TextStyles.w50011White(context)),
                ],
              )
            ],
          ),
        ),
        Container(
          width: Dimensions.screenWidth(context) / 1.55,
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20),
          padding: EdgeInsetsDirectional.only(start: 6.w, top: 5),
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
                      width: 30.w,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(companyImage))),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jobTitle,
                          style: TextStyles.w50013White(context),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          companyName,
                          style: TextStyles.w50011White(context),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 18.sp,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    applicants + "applicants".tr,
                    style: TextStyles.w40010White(context),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 18.sp,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "12" + " hours ago".tr,
                    style: TextStyles.w40010White(context),
                  ),
                ],
              ),
              SizedBox(height: 3),
              Row(
                children: [
                  Icon(
                    Icons.attach_money_outlined,
                    size: 18.sp,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "45k - 60k".tr,
                    style: TextStyles.w40010White(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
