import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/auth/forgot_password_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgotPasswordControllerImpl());
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<ForgotPasswordControllerImpl>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              SafeArea(
                  child: Text(
                "resetyourpassword".tr,
                style: Theme.of(context).textTheme.headline1,
              )),
              SizedBox(
                height: 50.h,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 15.w, end: 5.w),
                    child: Text(
                      "enteremail".tr,
                      maxLines: 3,
                      style: TextStyles.w50015grey(context),
                    )),
              ),
              Customtextformfiled(
                hinttext: "email1".tr,
                labelText: "email2".tr,
                icondata: Icons.mail_outlined,
                controller: controller.email,
                min: 10,
                max: 30,
                isnumber: false,
                ispassword: false,
                isBorder: true,
                isLabel: false,
              ),
              SizedBox(
                height: 60.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: Dimensions.screenWidth(context),
                  height: 40.h,
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  alignment: Alignment.center,
                  decoration: AppButtons.buttonDecoration,
                  child: Text(
                    "send".tr,
                    style: TextStyles.w50016White(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
