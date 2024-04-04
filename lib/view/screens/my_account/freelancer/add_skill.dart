import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/my_account_controller/my_account_free_lancer_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class AddSkill extends StatelessWidget {
  final MyAccountFreelancerControllerImpl controller;
  const AddSkill({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back)),
                  SizedBox(width: 10.w),
                  Text(
                    "addskill".tr,
                    style: TextStyles.w50019(context),
                  ),
                ],
              ),
            )),
            SizedBox(height: 20.h),
            Customtextformfiled(
              hintText: "addyourskill".tr,
              labelText: "",
              iconData: Icons.search,
              isLabel: false,
              controller: controller.skill,
              min: 2,
              max: 10,
              isValidation: false,
              isNumber: false,
              isPassword: false,
              isFilled: true,
            ),
            SizedBox(height: 10.h),
            Container(
              width: Dimensions.screenWidth(context),
              height: 540.h,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              //bottom: 1,
              child: Container(
                width: Dimensions.screenWidth(context),
                height: 40.h,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                decoration: AppButtons.buttonDecoration,
                child: Text(
                  "save".tr,
                  style: TextStyles.w50016White(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
