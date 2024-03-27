import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/auth/signup_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/auth/sign_up/birthdate.dart';
import 'package:joblance/view/screens/auth/sign_up/company_or_freelancer.dart';
import 'package:joblance/view/screens/auth/sign_up/drop_down.dart';
import 'package:joblance/view/screens/auth/sign_up/text_fileds.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImpl());
    return WillPopScope(
      onWillPop: exitAlert,
      child: Scaffold(
        body: GetBuilder<SignUpControllerImpl>(
          builder: (controller) => SingleChildScrollView(
            child: Form(
              key: controller.formState,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SafeArea(
                    child: Text(
                      controller.isGoogleSignin
                          ? "completeyourinfo".tr
                          : "addyourinfo".tr,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Visibility(
                    visible: !controller.isGoogleSignin,
                    child: GestureDetector(
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
                                borderRadius: BorderRadius.circular(70),
                                child: Image.file(File(controller.image.path),
                                    fit: BoxFit.fill,
                                    width: 120.w,
                                    height: 140.h),
                              ),
                      ),
                    ),
                  ),
                  CompanyOrFreeLancer(
                    controller: controller,
                  ),
                  TextFileds(controller: controller),
                  BirthDate(controller: controller),
                  //SizedBox(height: 15.h),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Container(
                      margin: EdgeInsetsDirectional.only(
                        top: 15.h,
                        start: 20.w,
                      ),
                      child: controller.isFreelancer
                          ? Text(
                              "studycase".tr,
                              style: TextStyles.w50012(context),
                            )
                          : Text(
                              "numofemployees".tr,
                              style: TextStyles.w50012(context),
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
                      margin: EdgeInsetsDirectional.only(start: 20.w, top: 5.h),
                      child: Text(
                        "major".tr,
                        style: TextStyles.w50012(context),
                      ),
                    ),
                  ),
                  DropDownWidget(
                      title: "major",
                      choices: controller.major,
                      elementValue: controller.majorValue,
                      controller: controller),
                  Visibility(
                    visible: controller.isFreelancer,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color:
                                  Theme.of(context).colorScheme.onSecondary)),
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 20.h),
                      padding: EdgeInsetsDirectional.only(
                          start: 20.w, top: 5.h, bottom: 5.h, end: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "opentowork".tr,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w500),
                          ),
                          Checkbox(
                              activeColor: LightAppColors.greenColor,
                              checkColor: LightAppColors.primaryColor,
                              value: controller.openToWork,
                              onChanged: (val) {
                                controller.changeOpenToWork();
                              }),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!controller.isGoogleSignin)
                        controller.goToSuccessfulSignUp();
                      else
                        controller.googleSignUp();
                    },
                    child: Container(
                      width: Dimensions.screenWidth(context),
                      height: 45.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 40.h),
                      decoration: AppButtons.buttonDecoration,
                      child: Text(
                        "signup".tr,
                        style: TextStyles.w50016White(context),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !controller.isGoogleSignin,
                    child: Wrap(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "alreadyhaveaccount".tr,
                              style: TextStyles.w50013(context),
                            ),
                            TextButton(
                                onPressed: () {
                                  controller.goToLogiIn();
                                },
                                child: Text(
                                  "login".tr,
                                  style: TextStyle(
                                      color: LightAppColors.primaryColor),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
