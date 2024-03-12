import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/auth/signup_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/auth/sign_up/company_or_freelancer.dart';
import 'package:joblance/view/screens/auth/sign_up/drop_down.dart';
import 'package:joblance/view/screens/auth/sign_up/text_fileds.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImpl());
    return Scaffold(
      body: GetBuilder<SignUpControllerImpl>(
        builder: (controller) => SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SafeArea(
                  child: Text(
                    "addyourinfo".tr,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: Container(
                    width: 120.w,
                    height: 140.h,
                    margin: EdgeInsets.symmetric(vertical: 25.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: controller.image == null
                        ? const Icon(
                            Icons.photo_camera_outlined,
                            size: 50,
                          )
                        : ClipRRect(
                            //clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(70),
                            child: Image.file(File(controller.image.path),
                                fit: BoxFit.fill, width: 120.w, height: 140.h),
                          ),
                  ),
                ),
                CompanyOrFreeLancer(
                  controller: controller,
                ),
                TextFileds(controller: controller),
                SizedBox(height: 15.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    margin: EdgeInsetsDirectional.only(
                      start: 20.w,
                    ),
                    child: controller.isFreelancer
                        ? Text(
                            "studycase".tr,
                            style: TextStyles.w50012,
                          )
                        : Text(
                            "numofemployees".tr,
                            style: TextStyles.w50012,
                          ),
                  ),
                ),
                DropDownWidget(
                    title: "employees",
                    choices: controller.isFreelancer
                        ? controller.studyCase
                        : controller.numOfEmployeesList,
                    elementValue: controller.numOfEmployees,
                    controller: controller),
                SizedBox(
                  height: 15.h,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    margin: EdgeInsetsDirectional.only(
                      start: 20.w,
                    ),
                    child: Text(
                      "major".tr,
                      style: TextStyles.w50012,
                    ),
                  ),
                ),
                DropDownWidget(
                    title: "major",
                    choices: controller.major,
                    elementValue: controller.majorValue,
                    controller: controller),
                GestureDetector(
                  child: Container(
                    width: Dimensions.screenwidth(context),
                    height: 45.h,
                    alignment: Alignment.center,
                    margin:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
                    decoration: AppButtons.buttonDecoration,
                    child: Text(
                      "signup".tr,
                      style: TextStyles.w50016White,
                    ),
                  ),
                ),
                Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "alreadyhaveaccount".tr,
                          style: TextStyles.w50013,
                        ),
                        TextButton(
                            onPressed: () {
                              controller.goToLogiIn();
                            },
                            child: Text(
                              "login".tr,
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
