import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/auth/login_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogInControllerImpl());
    return WillPopScope(
      onWillPop: 
        exitAlert,
      child: Scaffold(
          body: GetBuilder<LogInControllerImpl>(
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
                  "title1".tr,
                  style: Theme.of(context).textTheme.headline1,
                )),
                SizedBox(
                    width: Dimensions.screenwidth(context),
                    height: 250.h,
                    child: Image.asset(AppImages.logo)),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 15.w, top: 20.h, bottom: 10.h),
                  child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "logintocontinue".tr,
                        style: TextStyles.bold17,
                      )),
                ),
                Customtextformfiled(
                  hinttext: "email2".tr,
                  labelText: "email1".tr,
                  icondata: Icons.mail_outlined,
                  controller: controller.emailController,
                  min: 10,
                  max: 30,
                  isnumber: false,
                  ispassword: false,
                  isBorder: true,
                ),
                Customtextformfiled(
                  hinttext: "password2".tr,
                  labelText: "password1".tr,
                  icondata: Icons.lock_outline,
                  controller: controller.passwordController,
                  min: 8,
                  max: 18,
                  isnumber: false,
                  ispassword: controller.isshown,
                  isBorder: true,
                  ontapicon: controller.showPassword(),
                ),
                SizedBox(
                  height: 50.h,
                ),
                GestureDetector(
                  onTap: () {
                    controller.logIn();
                  },
                  child: Container(
                    width: Dimensions.screenwidth(context),
                    height: 45.h,
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    alignment: Alignment.center,
                    decoration: AppButtons.buttonDecoration,
                    child: Text(
                      "login".tr,
                      style: TextStyles.w50016White,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Divider(
                        thickness: 0.3,
                        color: Colors.grey,
                      )),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text(
                            "or".tr,
                            style: TextStyles.w40014grey,
                          )),
                      const Expanded(
                          child: Divider(
                        thickness: 0.3,
                        color: Colors.grey,
                      )),
                    ],
                  ),
                ),
                Container(
                  width: Dimensions.screenwidth(context),
                  height: 45.h,
                  margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(17)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 25.w,
                        height: 25.h,
                        child: Image.asset(AppImages.google),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text("continuewithgoogle".tr),
                    ],
                  ),
                ),
                //SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "createaccount".tr,
                        style: TextStyles.w50013,
                      ),
                      TextButton(
                        child: Text(
                          "signup".tr,
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {
                          controller.goToSignup();
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
