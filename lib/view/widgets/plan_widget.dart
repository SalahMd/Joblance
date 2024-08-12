import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class PlanWidget extends StatelessWidget {
  final String planName;
  final String planPrice;
  final List<String> features;
  final List<String> notInclded;
  final void Function() onConfirm;
  const PlanWidget(
      {super.key,
      required this.planName,
      required this.planPrice,
      required this.features,
      required this.onConfirm,
      required this.notInclded});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth(context),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primaryContainer,
        border: Border.all(color: LightAppColors.primaryColor, width: 0.8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            planName,
            style: TextStyles.w50015(context),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            planPrice + " \$",
            style: TextStyles.w50017(context),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
              itemCount: features.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Row(
                    children: [
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.done,
                        size: 18.sp,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        features[index],
                        style: TextStyles.w40012grey(context),
                      )
                    ],
                  ),
                );
              }),
          ListView.builder(
              itemCount: notInclded.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.block,
                      size: 18.sp,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      notInclded[index],
                      style: TextStyles.w40012grey(context),
                    )
                  ],
                );
              }),
          SizedBox(height: 30.h),
          GestureDetector(
            onTap: () {
              onConfirm();
            },
            child: Center(
              child: Container(
                alignment: Alignment.center,
                width: 120.w,
                height: 35.h,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromARGB(135, 157, 219, 255),
                          Color.fromARGB(135, 157, 219, 255),
                          Color.fromARGB(121, 140, 194, 255),
                          Color.fromARGB(102, 118, 161, 255),
                          Color.fromARGB(90, 104, 141, 255)
                        ]),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "confirm".tr,
                  style: TextStyles.w50013(context),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
