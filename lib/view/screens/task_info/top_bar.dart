import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/add_offer/add_offer.dart';
import 'package:joblance/view/screens/job_info/tob_bar.dart';
import 'package:joblance/view/screens/profile/company_profile/company_profile.dart';

class TaskTobBar extends StatelessWidget {
  final Image userImage;
  final String userName;
  final String taskTitle;
  final String major;
  final String budget;
  final String duration;
  final bool isActive;

  const TaskTobBar(
      {super.key,
      required this.userImage,
      required this.userName,
      required this.taskTitle,
      required this.major,
      required this.isActive,
      required this.budget,
      required this.duration});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        JobTobBar(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(CompanyProfile());
                    },
                    child: Container(
                      width: 45.w,
                      height: 55.h,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: ClipRRect(
                          child: userImage,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              taskTitle,
                              style: TextStyles.w50015(context),
                            ),
                            Text(
                              userName,
                              style: TextStyles.w50013(context),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.attach_money,
                            size: 15.sp,
                            color: LightAppColors.greyColor,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            budget,
                            style: TextStyles.w40012grey(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Icon(Icons.access_time_filled_sharp,
                                size: 15.sp, color: LightAppColors.whiteColor),
                            SizedBox(width: 8.w),
                            Text(
                              "excutingtime".tr + " : ",
                              style: TextStyles.w40012grey(context),
                            ),
                            Text(
                              duration,
                              style: TextStyles.w40012grey(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work_outline, size: 15.sp),
                            SizedBox(width: 8.w),
                            Text(
                              "major".tr + ": " + major,
                              style: TextStyles.w40012grey(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month_outlined, size: 15.sp),
                            SizedBox(width: 8.w),
                            Text(
                              "2 weeks ago".tr,
                              style: TextStyles.w40012grey(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 10.w,
                              height: 12.h,
                              margin: EdgeInsetsDirectional.only(start: 2.w),
                              decoration: BoxDecoration(
                                  color: LightAppColors.greenColor,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "active".tr,
                              style: TextStyles.w40012grey(context),
                            ),
                          ],
                        ),
                      ]),
                  GestureDetector(
                    onTap: () {
                      Get.to(AddOffer());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 65.h),
                      child: Container(
                        width: 100.w,
                        height: 30.h,
                        alignment: Alignment.center,
                        decoration: AppButtons.buttonDecoration,
                        child: Text(
                          "addoffer".tr,
                          style: TextStyles.w50013White(context),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
