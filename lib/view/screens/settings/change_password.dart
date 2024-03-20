import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/change_password_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class CahngePassword extends StatelessWidget {
  const CahngePassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordControllerImpl());
    return Scaffold(
      body: GetBuilder<ChangePasswordControllerImpl>(
        builder: (controller) => SingleChildScrollView(
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
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back)),
                    SizedBox(width: 10.w),
                    Text(
                      "changepassword".tr,
                      style: TextStyles.w50019(context),
                    ),
                  ]),
                )),
                //SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 10.w, top: 50.h, end: 10.w),
                  child: Text("Create a new password for your account".tr,
                      style: TextStyles.w50015(context)),
                ),
                Customtextformfiled(
                  hinttext: "oldpassword1".tr,
                  labelText: "oldpassword2".tr,
                  icondata: Icons.remove_red_eye_outlined,
                  controller: controller.oldPassword,
                  min: 8,
                  max: 30,
                  isnumber: false,
                  ispassword: true,
                  isBorder: true,
                  padding: 30,
                ),
                Customtextformfiled(
                  hinttext: "newpassword1".tr,
                  labelText: "newpassword2".tr,
                  icondata: Icons.remove_red_eye_outlined,
                  controller: controller.newPassword,
                  min: 8,
                  max: 30,
                  isnumber: false,
                  ispassword: true,
                  isBorder: true,
                  padding: 30,
                ),
                Customtextformfiled(
                  hinttext: "confirmnewpassword2".tr,
                  labelText: "confirmnewpassword1".tr,
                  icondata: Icons.remove_red_eye_outlined,
                  controller: controller.confirmNewPassword,
                  min: 8,
                  max: 30,
                  isnumber: false,
                  ispassword: true,
                  isBorder: true,
                  padding: 30,
                  
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: Dimensions.screenWidth(context),
                  height: 40.h,
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
                  decoration: AppButtons.buttonDecoration,
                  child: Text(
                    "confirm".tr,
                    style: TextStyles.w50016White(context),
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
