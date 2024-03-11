import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/auth/signup_controller.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/text_styles.dart';

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
                  onTap: () {},
                  child: Container(
                    width: 200.w,
                    height: 200.h,
                    margin: EdgeInsets.symmetric(vertical: 25.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.photo_camera_outlined,
                      size: 50,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Customtextformfiled(
                        hinttext: "firstname2".tr,
                        labelText: "firstname1".tr,
                        icondata: Icons.person_outline,
                        controller: controller.firstName,
                        min: 3,
                        max: 10,
                        isnumber: false,
                        ispassword: false),
                    Customtextformfiled(
                        hinttext: "lastname2".tr,
                        labelText: "lastname1".tr,
                        icondata: Icons.person_outline,
                        controller: controller.lastName,
                        min: 3,
                        max: 10,
                        isnumber: false,
                        ispassword: false)
                  ],
                ),
                Customtextformfiled(
                    hinttext: "email2".tr,
                    labelText: "email1".tr,
                    icondata: Icons.mail_outline,
                    controller: controller.email,
                    min: 10,
                    max: 30,
                    isnumber: false,
                    ispassword: false),
                Customtextformfiled(
                    hinttext: "phone2".tr,
                    labelText: "phone1".tr,
                    icondata: Icons.phone_outlined,
                    controller: controller.phoneController,
                    min: 10,
                    max: 10,
                    isnumber: true,
                    ispassword: false),
                Customtextformfiled(
                    hinttext: "major2".tr,
                    labelText: "major1".tr,
                    icondata: Icons.work_outline,
                    controller: controller.email,
                    min: 3,
                    max: 30,
                    isnumber: false,
                    ispassword: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
