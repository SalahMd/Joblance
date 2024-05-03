import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/widgets/divider.dart';

class JobApplicantsTobBar extends StatelessWidget {
  const JobApplicantsTobBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Text(
                "Flutter developer",
                style: TextStyles.w50017(context),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                Icons.edit_outlined,
                size: 18.sp,
                color: LightAppColors.primaryColor,
              ),
            )
          ],
        ),
        SizedBox(height: 10.h),
        Row(
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
                        Text("3" + "applicants".tr,
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
                        Text("2 weeks ago".tr,
                            style: TextStyles.w40011grey(context)),
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
                        SizedBox(
                          width: 5.w,
                        ),
                        Text("active".tr,
                            style: TextStyles.w40011grey(context)),
                      ],
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Container(
                  width: 50.w,
                  height: 26.h,
                  margin: EdgeInsets.only(top: 40.h),
                  alignment: Alignment.center,
                  decoration: AppButtons.buttonDecoration,
                  child: Text(
                    "inactive".tr,
                    style: TextStyles.w50012White(context),
                  ),
                ))
          ],
        ),
        MyDivider()
      ],
    ));
  }
}
