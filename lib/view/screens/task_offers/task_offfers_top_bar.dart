import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/widgets/divider.dart';

class TaskOffersTopBar extends StatelessWidget {
  final String name;
  final String dateOfPost;
  final String numOfOffers;
  const TaskOffersTopBar(
      {super.key,
      required this.name,
      required this.numOfOffers,
      required this.dateOfPost});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            SizedBox(width: 5.w),
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back)),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "taskoffers".tr,
              style: TextStyles.w50018(context),
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  name,
                  style: TextStyles.w50017(context),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 10.w),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 13.sp,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(numOfOffers + " " + "offers".tr,
                              style: TextStyles.w40011grey(context)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 13.sp,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                              Jiffy.parse(dateOfPost)
                                  .from(Jiffy.now())
                                  .toString(),
                              style: TextStyles.w40011grey(context)),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
        MyDivider()
      ],
    ));
  }
}
