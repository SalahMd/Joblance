import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/add_offer/add_offer.dart';
import 'package:joblance/view/screens/job_info/task_and_tob_bar.dart';
import 'package:joblance/view/screens/profile/company_profile/company_profile.dart';
import 'package:joblance/view/screens/profile/freelancer_profile/freelancer_profile.dart';
import 'package:joblance/view/screens/task_offers/task_offers.dart';

class TaskTobBar extends StatelessWidget {
  final String userImage;
  final String userName;
  final String taskTitle;
  final String major;
  final String budget;
  final int userId;
  final int taskId;
  final String duration;
  final bool isActive, isOwner;
  final void Function() onTap;
  final void Function()? onDelete;
  final String date;
  final int userRole;
  const TaskTobBar(
      {super.key,
      required this.userImage,
      required this.userName,
      required this.taskTitle,
      required this.major,
      required this.isActive,
      required this.budget,
      required this.duration,
      required this.userId,
      required this.isOwner,
      required this.onTap,
      this.onDelete,
      required this.date,
      required this.taskId,
      required this.userRole});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TaskAndJobTobBar(
          isOwner: isOwner,
          onTap: onTap,
          onDelete: onDelete,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (userRole == 1)
                        Get.to(CompanyProfile(id: userId));
                      else
                        Get.to(FreelancerProfile(id: userId));
                    },
                    child: Container(
                      width: 45.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                          child: Image.network(
                            AppLinks.IP + userImage,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 12.w),
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
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 9.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                              size: 15.sp,
                              color: LightAppColors.greyColor,
                            ),
                            Text(
                              budget,
                              style: TextStyles.w40011grey(context),
                            ),
                          ],
                        ),
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
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              size: 15.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "excutingtime".tr + " : ",
                              style: TextStyles.w40011grey(context),
                            ),
                            Text(
                              duration + " " + "days".tr,
                              style: TextStyles.w40011grey(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work_outline, size: 15.sp),
                            SizedBox(width: 5.w),
                            Text(
                              "major".tr + ": " + major,
                              style: TextStyles.w40011grey(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month_outlined, size: 15.sp),
                            SizedBox(width: 5.w),
                            Text(
                              Jiffy.parse(date).fromNow().toString(),
                              style: TextStyles.w40011grey(context),
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
                                  color: isActive
                                      ? LightAppColors.greenColor
                                      : Colors.red[800],
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(width: 7.w),
                            Text(
                              isActive ? "active".tr : "inactive".tr,
                              style: TextStyles.w40011grey(context),
                            ),
                          ],
                        ),
                      ]),
                  Visibility(
                    visible: isActive || isOwner,
                    child: GestureDetector(
                      onTap: () {
                        if (!isOwner)
                          Get.to(AddOffer(
                            taskId: taskId,
                          ));
                        else {
                          Get.to(TaskOffers(
                            id: taskId.toString(),
                            name: taskTitle,
                            dateOfPost: date,
                          ));
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 65.h),
                        child: Container(
                          width: 100.w,
                          height: 30.h,
                          alignment: Alignment.center,
                          decoration: AppButtons.buttonDecoration,
                          child: Text(
                            isOwner ? "offers".tr : "addoffer".tr,
                            style: TextStyles.w50013White(context),
                          ),
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
