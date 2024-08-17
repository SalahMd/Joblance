import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jiffy/jiffy.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/job_info/job_info.dart';

class SliderWidget extends StatelessWidget {
  final String companyImage;
  final String companyName;
  final String major;
  final String jobTitle;
  final String date;
  final String jobExperience;
  final String remote;
  final int id;
  const SliderWidget(
      {super.key,
      required this.companyImage,
      required this.companyName,
      required this.major,
      required this.jobTitle,
      required this.remote,
      required this.date,
      required this.jobExperience,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(JobInfo(id: id));
      },
      child: Stack(
        children: [
          Container(
            height: 170.h,
            alignment: AlignmentDirectional.centerEnd,
            padding: EdgeInsetsDirectional.only(end: 10.w, top: 20, bottom: 6),
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
              //  mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                    Text(remote, style: TextStyles.w50011White(context)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: Dimensions.screenWidth(context) / 1.55,
            height: 170.h,
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
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
                        width: 35.sp,
                        height: 40.sp,
                        margin: EdgeInsetsDirectional.only(top: 5.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              AppLinks.IP + companyImage,
                              fit: BoxFit.fill,
                            ))),
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
                      Icons.cases_outlined,
                      size: 18.sp,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      major,
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
                      Jiffy.parse(date).fromNow().toString(),
                      style: TextStyles.w40010White(context),
                    ),
                  ],
                ),
                SizedBox(height: 3),
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
                      jobExperience,
                      style: TextStyles.w40010White(context),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
