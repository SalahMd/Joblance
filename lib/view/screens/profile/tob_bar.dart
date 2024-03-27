import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class TobBar extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  const TobBar(
      {super.key,
      required this.image,
      required this.name,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: Dimensions.screenWidth(context),
              height: 180.h,
              color: Colors.grey,
              child: Image.asset(
                AppImages.joblance,
                fit: BoxFit.fill,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SafeArea(
                child: Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
            Container(
              width: 110,
              height: 110,
              alignment: Alignment.center,
              margin: EdgeInsetsDirectional.only(start: 5.w, top: 125.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  )),
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                name,
                style: TextStyles.w50017(context),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                description,
                style: TextStyles.w50012(context),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "10 M Followers",
                style: TextStyles.w40012grey(context),
              ),
              Text(
                "10k" + "employees".tr,
                style: TextStyles.w40012grey(context),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 40.h,
                    alignment: Alignment.center,
                    decoration: AppButtons.buttonDecoration,
                    child: Text("follow".tr,
                        style: TextStyles.w50013White(context)),
                  )),
                  SizedBox(width: 10.w),
                  Expanded(
                      child: Container(
                    height: 40.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.onSecondary)),
                    child:
                        Text("message".tr, style: TextStyles.w50012(context)),
                  )),
                ],
              ),
            ])),
      ],
    );
  }
}
