import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/auth/signup_controller.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class TextFileds extends StatelessWidget {
  final SignUpControllerImpl controller;
  TextFileds({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Customtextformfiled(
                hintText: controller.isFreelancer
                    ? "firstname1".tr
                    : "companyname1".tr,
                labelText: controller.isFreelancer
                    ? "firstname2".tr
                    : "companyname2".tr,
                iconData: Icons.person_outline,
                controller: controller.firstName,
                min: 3,
                max: 10,
                isNumber: false,
                isPassword: false,
                isBorder: true,
              ),
            ),
            Visibility(
              visible: controller.isFreelancer,
              child: Expanded(
                child: Customtextformfiled(
                  hintText: "lastname1".tr,
                  labelText: "lastname2".tr,
                  iconData: Icons.person_outline,
                  controller: controller.lastName,
                  min: 3,
                  max: 10,
                  isNumber: false,
                  isPassword: false,
                  isBorder: true,
                ),
              ),
            )
          ],
        ),
        Customtextformfiled(
          hintText: "email1".tr,
          labelText: "email2".tr,
          iconData: Icons.mail_outline,
          controller: controller.email,
          min: 10,
          max: 30,
          isNumber: false,
          isPassword: false,
          isBorder: true,
        ),
        GestureDetector(
          onTap: () {
            controller.updateCountry(context);
          },
          child: Container(
              width: Dimensions.screenWidth(context),
              height: 55.h,
              alignment: AlignmentDirectional.centerStart,
              margin: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
              padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.onSecondary)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      controller.country != null
                          ? controller.country.toString()
                          : "chooseyourcountry".tr,
                      style: TextStyle(fontSize: 17, color: Colors.grey)),
                  Icon(Icons.location_on_outlined)
                ],
              )),
        ),
        Customtextformfiled(
          hintText: "phone1".tr,
          labelText: "phone2".tr,
          iconData: Icons.phone_outlined,
          controller: controller.phoneController,
          min: 10,
          max: 13,
          isNumber: true,
          isPassword: false,
          isBorder: true,
        ),
        Customtextformfiled(
          hintText: "password1".tr,
          labelText: "password2".tr,
          iconData: Icons.remove_red_eye_outlined,
          controller: controller.passwordController,
          min: 8,
          max: 30,
          isNumber: false,
          isPassword: controller.isshown,
          isBorder: true,
          ontapicon: controller.showPassword,
        ),
        Customtextformfiled(
          hintText: "confirmpassword1".tr,
          labelText: "confirmpassword2".tr,
          iconData: Icons.remove_red_eye_outlined,
          controller: controller.confirmPasswordController,
          min: 8,
          max: 30,
          isNumber: false,
          isPassword: controller.isshown,
          isBorder: true,
          ontapicon: controller.showPassword,
        ),
        Visibility(
          visible: !controller.isFreelancer,
          child: Customtextformfiled(
            hintText: "aboutcompany2".tr,
            labelText: "aboutcompany".tr,
            iconData: Icons.lock_outline,
            controller: controller.aboutCompanyController,
            min: 10,
            max: 150,
            isNumber: false,
            isPassword: false,
            isBorder: false,
            letters: 150,
            maxLines: 3,
            isValidation: false,
          ),
        ),
      ],
    );
  }
}
