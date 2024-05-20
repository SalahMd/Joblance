import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/create_CV_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/date_picker.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class CVBirthDate extends StatelessWidget {
  const CVBirthDate({super.key, required this.controller});
  final CreateCVControllerImpl controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Container(
            margin: EdgeInsetsDirectional.only(
              start: 12.w,
            ),
            child: Text(
              "birthdate".tr,
              style: TextStyles.w50014(context),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            controller.birthDate = await selectDate(context);
            controller.update();
          },
          child: Container(
              width: Dimensions.screenWidth(context),
              height: 55.h,
              alignment: AlignmentDirectional.centerStart,
              margin: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
              padding: EdgeInsetsDirectional.symmetric(horizontal: 17.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //border: Border.all(
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      controller.birthDate != ""
                          ? controller.birthDate
                          : "youbirthdate".tr,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onSecondary)),
                  Icon(Icons.calendar_month_outlined)
                ],
              )),
        ),
      ],
    );
  }
}
