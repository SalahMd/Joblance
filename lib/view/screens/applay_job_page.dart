import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/applay_job_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class ApplayJobPage extends StatelessWidget {
  const ApplayJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ApplayJobControllerImpl());
    return GetBuilder<ApplayJobControllerImpl>(
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                SafeArea(
                    child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 10.w),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back)),
                      SizedBox(width: 10.w),
                      Text(
                        "applayforthejob".tr,
                        style: TextStyles.w50019(context),
                      ),
                    ],
                  ),
                )),
                SizedBox(height: 30.h),
                Text("fillyourofferinformation".tr,style: TextStyles.w40013grey(context),),
                SizedBox(height:10.h),
                Row(
                  children: [
                    Expanded(
                        child: Customtextformfiled(
                      hintText: "firstname2".tr,
                      labelText: "",
                      iconData: null,
                      controller: controller.firstName,
                      min: 3,
                      max: 10,
                      isNumber: false,
                      isPassword: false,
                      isBorder: true,
                      isLabel: false,
                      isFilled: true,
                    )),
                    Expanded(
                        child: Customtextformfiled(
                      hintText: "lastname2".tr,
                      labelText: "",
                      iconData: null,
                      controller: controller.lastName,
                      min: 3,
                      max: 10,
                      isNumber: false,
                      isPassword: false,
                      isBorder: true,
                      isLabel: false,
                      isFilled: true,
                    ))
                  ],
                ),
                Customtextformfiled(
                  hintText: "email1".tr,
                  labelText: "",
                  iconData: Icons.mail_outline,
                  controller: controller.email,
                  min: 10,
                  max: 35,
                  isNumber: false,
                  isPassword: false,
                  isBorder: true,
                  isFilled: true,
                  isLabel: false,
                ),
                Customtextformfiled(
                  hintText: "phone1".tr,
                  labelText: "",
                  iconData: Icons.phone_outlined,
                  controller: controller.phoneNumber,
                  min: 10,
                  max: 15,
                  isNumber: true,
                  isPassword: true,
                  isFilled: true,
                  isBorder: true,
                  isLabel: false,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Customtextformfiled(
                      hintText: "expectedsalary".tr,
                      labelText: "",
                      iconData: null,
                      controller: controller.salary,
                      min: 1,
                      max: 10,
                      isNumber: true,
                      isPassword: false,
                      isBorder: true,
                      isLabel: false,
                      isFilled: true,
                    )),
                    Expanded(
                        child: Customtextformfiled(
                      hintText: "yearsofexperience".tr,
                      labelText: "",
                      iconData: null,
                      controller: controller.yearsOfExperience,
                      min: 1,
                      max: 3,
                      isNumber: true,
                      isPassword: false,
                      isBorder: true,
                      isLabel: false,
                      isFilled: true,
                    ))
                  ],
                ),
                Customtextformfiled(
                  hintText: "coverletter".tr + " " + "optional".tr,
                  labelText: "",
                  iconData: null,
                  controller: controller.coverLetter,
                  min: 10,
                  max: 400,
                  isNumber: false,
                  isValidation: false,
                  isPassword: false,
                  isBorder: false,
                  isLabel: false,
                  isFilled: true,
                  textInputAction: TextInputAction.newline,
                  minLines: 4,
                  maxLines: 6,
                ),
                GestureDetector(
                  onTap: () {
                    controller.uploadCV();
                  },
                  child: Container(
                    width: Dimensions.screenWidth(context),
                    height: 40.h,
                    alignment: Alignment.center,
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.onSecondary),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      controller.fileName != null
                          ? controller.fileName!
                          : "uploadyourcv".tr,
                      style: TextStyles.w50014(context),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.applay();
                  },
                  child: Container(
                    width: Dimensions.screenWidth(context),
                    height: 40.h,
                    margin:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 30.h),
                    decoration: AppButtons.buttonDecoration,
                    alignment: Alignment.center,
                    child: Text(
                      "applay".tr,
                      style: TextStyles.w50012White(context),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
