import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/auth/email_verifiction.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmailVerifictionControllerImpl());
    return Scaffold(
      body: GetBuilder<EmailVerifictionControllerImpl>(
        builder: (controller) => SingleChildScrollView(
          child: Form(
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
                  height: 50.h,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 10.w, bottom: 30.h, end: 10.w),
                      child: Text(
                        "receivedcode".tr + controller.email!,
                        maxLines: 3,
                        style: TextStyles.w50015grey(context),
                      )),
                ),
                OtpTextField(
                  numberOfFields: 6,
                  focusedBorderColor: LightAppColors.primaryColor,
                  borderColor: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(15),
                  fieldWidth: 40.w,
                  textStyle: TextStyle(
                      color: LightAppColors.primaryColor, fontSize: 20),
                  showFieldAsBox: true,
                  onSubmit: (String verificationCode) {
                    controller.codeController = verificationCode;
                    controller.checkCode();
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: controller.timer != 0,
                      child: Text(
                        "resendthecode".tr + controller.timer.toString(),
                        style: TextStyles.w40014grey(context),
                      ),
                    ),
                    Visibility(
                      visible: controller.timer == 0,
                      child: TextButton(
                          onPressed: () {
                            controller.reSendCode();
                            controller.startTimer();
                          },
                          child: Text("resend".tr,
                              style: TextStyle(
                                  color: LightAppColors.primaryColor,
                                  fontSize: 13.sp))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
