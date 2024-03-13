import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class CompanyInfo extends StatelessWidget {
  final Image companyImage;
  final String companyName;
  final String numOfEmployees;
  final String jobType;
  final String jobTitle;
  final String remote;
  final String jobLocation;
  final String major;
  const CompanyInfo(
      {super.key,
      required this.companyImage,
      required this.companyName,
      required this.numOfEmployees,
      required this.jobType,
      required this.jobTitle,
      required this.jobLocation,
      required this.remote,
      required this.major});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenwidth(context),
      height: 210.h,
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: Dimensions.screenwidth(context),
            height: 95.h,
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 60.h,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: ClipRRect(
                          child: companyImage,
                          borderRadius: BorderRadius.circular(5)),
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
                          style: TextStyles.w50017,
                        ),
                        //SizedBox(height: .h),
                        Text(
                          companyName,
                          style: TextStyles.w50014,
                        ),
                        //izedBox(height: 3.h),
                        Row(
                          children: [
                            Text(
                              jobLocation + " - " + remote,
                              style: TextStyles.w40012grey,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(Icons.work_outline, size: 18),
                    SizedBox(width: 8.w),
                    Text(
                      "major".tr + ": " + major,
                      style: TextStyles.w40012grey,
                    ),
                  ],
                ),
                //SizedBox(height: 7.h),
                Row(
                  children: [
                    Icon(Icons.apartment_outlined, size: 18),
                    SizedBox(width: 8.w),
                    Text(
                      numOfEmployees + " " + "employees".tr,
                      style: TextStyles.w40012grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, size: 18),
                    SizedBox(width: 8.w),
                    Text(
                      "2 weeks ago".tr,
                      style: TextStyles.w40012grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    //Icon(Icons.event_available_outlined, size: 18),
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
                      style: TextStyles.w40012grey,
                    ),
                  ],
                ),
              ]),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 50.w, top: 65.h),
                child: Container(
                  width: 90.w,
                  height: 30.h,
                  alignment: Alignment.center,
                  decoration: AppButtons.buttonDecoration,
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //     border: Border.all(color: LightAppColors.primaryColor)),
                  child: Text(
                    "applay".tr,
                    style: TextStyles.w50016White,
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
