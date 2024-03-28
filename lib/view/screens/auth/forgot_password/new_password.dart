import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/auth/email_verifiction.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmailVerifictionControllerImpl(context: context));
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<EmailVerifictionControllerImpl>(
          builder: (controller) => Form(
            key: controller.formState,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SafeArea(
                    child: Text(
                  "emailverified".tr,
                  style: Theme.of(context).textTheme.headline1,
                )),
                SizedBox(
                  height: 50.h,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                      padding:
                          EdgeInsetsDirectional.only(start: 15.w, end: 5.w),
                      child: Text(
                        "enternewpassword".tr,
                        maxLines: 3,
                        style: TextStyles.w50015grey(context),
                      )),
                ),
                Customtextformfiled(
                  hintText: "password1".tr,
                  labelText: "password2".tr,
                  iconData: Icons.remove_red_eye_outlined,
                  controller: controller.password,
                  min: 8,
                  max: 30,
                  isNumber: false,
                  isPassword: controller.isShown,
                  isBorder: true,
                  ontapicon: controller.showPassword,
                ),
                Customtextformfiled(
                  hintText: "confirmpassword1".tr,
                  labelText: "confirmpassword2".tr,
                  iconData: Icons.remove_red_eye_outlined,
                  controller: controller.confirmPassword,
                  min: 8,
                  max: 30,
                  isNumber: false,
                  isPassword: controller.isShown,
                  isBorder: true,
                  ontapicon: controller.showPassword,
                ),
                SizedBox(
                  height: 60.h,
                ),
                GestureDetector(
                  onTap: () {
                    controller.resetPassword();
                  },
                  child: Container(
                    width: Dimensions.screenWidth(context),
                    height: 40.h,
                    margin: EdgeInsets.symmetric(
                      horizontal: 30.w,
                    ),
                    alignment: Alignment.center,
                    decoration: AppButtons.buttonDecoration,
                    child: Text(
                      "reset".tr,
                      style: TextStyles.w50016White(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
