import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/auth/email_verifiction.dart';
import 'package:joblance/core/constants/colors.dart';

class EmailVerifiction extends StatelessWidget {
  const EmailVerifiction({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmailVerifictionControllerImpl());
    return Scaffold(
      body: GetBuilder<EmailVerifictionControllerImpl>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              SafeArea(
                  child: Text(
                "verifyingcode".tr,
                style: Theme.of(context).textTheme.headline1,
              )),
              SizedBox(
                height: 20.h,
              ),
              OtpTextField(
                numberOfFields: 5,
                focusedBorderColor: LightAppColors.primaryColor,
                borderColor: Theme.of(context).colorScheme.onSecondary,
                borderRadius: BorderRadius.circular(20),
                fieldWidth: 50,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,

                onSubmit: (String verificationCode) {
                  controller.goToSuccessSignUp(verificationCode);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
