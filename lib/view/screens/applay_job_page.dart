import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                  isLabel: false,
                ),
                Customtextformfiled(
                  hintText: "phone1".tr,
                  labelText: "",
                  iconData: Icons.phone_outlined,
                  controller: controller.phoneNumber,
                  min: 10,
                  max: 15,
                  isNumber: false,
                  isPassword: false,
                  isBorder: true,
                  isLabel: false,
                ),
                Customtextformfiled(
                  hintText: "coverletter".tr + " " + "optional".tr,
                  labelText: "",
                  iconData: null,
                  controller: controller.coverLetter,
                  min: 10,
                  max: 250,
                  isNumber: false,
                  isPassword: false,
                  isBorder: false,
                  isLabel: false,
                  maxLines: 6,
                  letters: 250,
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
