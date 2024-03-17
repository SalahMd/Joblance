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
                hinttext: controller.isFreelancer
                    ? "firstname1".tr
                    : "companyname1".tr,
                labelText: controller.isFreelancer
                    ? "firstname2".tr
                    : "companyname2".tr,
                icondata: Icons.person_outline,
                controller: controller.firstName,
                min: 3,
                max: 10,
                isnumber: false,
                ispassword: false,
                isBorder: true,
              ),
            ),
            Visibility(
              visible: controller.isFreelancer,
              child: Expanded(
                child: Customtextformfiled(
                  hinttext: "lastname1".tr,
                  labelText: "lastname2".tr,
                  icondata: Icons.person_outline,
                  controller: controller.lastName,
                  min: 3,
                  max: 10,
                  isnumber: false,
                  ispassword: false,
                  isBorder: true,
                ),
              ),
            )
          ],
        ),
        Customtextformfiled(
          hinttext: "email1".tr,
          labelText: "email2".tr,
          icondata: Icons.mail_outline,
          controller: controller.email,
          min: 10,
          max: 30,
          isnumber: false,
          ispassword: false,
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
          hinttext: "phone1".tr,
          labelText: "phone2".tr,
          icondata: Icons.phone_outlined,
          controller: controller.phoneController,
          min: 10,
          max: 10,
          isnumber: true,
          ispassword: false,
          isBorder: true,
        ),
        Customtextformfiled(
          hinttext: "password1".tr,
          labelText: "password2".tr,
          icondata: Icons.lock_outline,
          controller: controller.passwordController,
          min: 3,
          max: 30,
          isnumber: false,
          ispassword: false,
          isBorder: true,
        ),
        Customtextformfiled(
          hinttext: "confirmpassword1".tr,
          labelText: "confirmpassword2".tr,
          icondata: Icons.lock_outline,
          controller: controller.confirmPasswordController,
          min: 3,
          max: 30,
          isnumber: false,
          ispassword: false,
          isBorder: true,
        ),
        Visibility(
          visible: !controller.isFreelancer,
          child: Customtextformfiled(
            hinttext: "aboutcompany2".tr,
            labelText: "aboutcompany".tr,
            icondata: Icons.lock_outline,
            controller: controller.aboutCompanyController,
            min: 10,
            max: 150,
            isnumber: false,
            ispassword: false,
            isBorder: false,
            letters: 150,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
