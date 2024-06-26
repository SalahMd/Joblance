import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/profile/company_profile/company_profile.dart';

class CompanyInfo extends StatelessWidget {
  final String companyImage;
  final String companyName;
  final String numOfEmployees;
  final String jobType;
  final String jobTitle;
  final String remote;
  final String jobLocation;
  final Function() onTap;
  final String major;
  final salary;
  final bool isVisible;
  final String roleId;
  final String date;
  final int active;
  const CompanyInfo(
      {super.key,
      required this.companyImage,
      required this.companyName,
      required this.numOfEmployees,
      required this.jobType,
      required this.jobTitle,
      required this.jobLocation,
      required this.remote,
      required this.major,
      required this.isVisible,
      required this.onTap,
      required this.roleId,
      required this.date,
      required this.active,
      required this.salary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(CompanyProfile(id: 3));
                },
                child: Container(
                  width: 50.w,
                  height: 60.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: ClipRRect(
                      child: Image.network(
                        AppLinks.IP + companyImage,
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    jobTitle,
                    style: TextStyles.w50017(context),
                  ),
                  Text(
                    companyName,
                    style: TextStyles.w50014(context),
                  ),
                  Row(
                    children: [
                      Text(
                        jobLocation + " - " + remote,
                        style: TextStyles.w40012grey(context),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Icon(Icons.work_outline, size: 17.sp),
                    SizedBox(width: 8.w),
                    Text(
                      "major".tr + ": " + major,
                      style: TextStyles.w40012grey(context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.apartment_outlined, size: 17.sp),
                    SizedBox(width: 8.w),
                    Text(
                      "employees".tr + ": " + numOfEmployees,
                      style: TextStyles.w40012grey(context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, size: 17.sp),
                    SizedBox(width: 8.w),
                    Text(
                      Jiffy.parse(date).fromNow().toString(),
                      style: TextStyles.w40012grey(context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money_outlined, size: 17.sp),
                    SizedBox(width: 8.w),
                    Text(
                      "salary".tr + " " + salary.toString(),
                      style: TextStyles.w40012grey(context),
                    ),
                  ],
                ),
                Visibility(
                  child: Row(
                    children: [
                      Container(
                        width: 10.w,
                        height: 12.h,
                        margin: EdgeInsetsDirectional.only(start: 2.w),
                        decoration: BoxDecoration(
                            color: active == 1
                                ? LightAppColors.greenColor
                                : Colors.red[800],
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        active == 1 ? "active".tr : "inactive".tr,
                        style: TextStyles.w40012grey(context),
                      ),
                    ],
                  ),
                ),
              ]),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    onTap();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 65.h),
                    child: Container(
                      width: 90.w,
                      height: 30.h,
                      alignment: Alignment.center,
                      decoration: AppButtons.buttonDecoration,
                      child: Text(
                        roleId == "2" ? "applay".tr : "applicants".tr,
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
    );
  }
}
