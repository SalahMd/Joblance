import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/settings_controller/edit_profile_controller.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class ProfileTextField extends StatelessWidget {
  final EditProfileControllerImpl controller;
  const ProfileTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 15.w),
                    child: Text(
                      controller.isFreelancer
                          ? "firstname2".tr
                          : "companyname2".tr,
                      style: TextStyles.w50014(context),
                    ),
                  ),
                  Customtextformfiled(
                    hintText: "",
                    labelText: "".tr,
                    iconData: Icons.person_outline,
                    controller: controller.isFreelancer
                        ? controller.firstName
                        : controller.companyName,
                    min: 3,
                    max: 15,
                    isNumber: false,
                    isFilled: true,
                    padding: 10,
                    isPassword: false,
                    isLabel: false,
                    isBorder: true,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: controller.isFreelancer,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 15.w),
                      child: Text(
                        "lastname2".tr,
                        style: TextStyles.w50014(context),
                      ),
                    ),
                    Customtextformfiled(
                      hintText: "",
                      labelText: "".tr,
                      padding: 10,
                      iconData: Icons.person_outline,
                      controller: controller.lastName,
                      min: 3,
                      max: 10,
                      isNumber: false,
                      isPassword: false,
                      isBorder: true,
                      isLabel: false,
                      isFilled: true,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 10.h),
          child: Text(
            "phone2".tr,
            style: TextStyles.w50014(context),
          ),
        ),
        Customtextformfiled(
          hintText: "",
          labelText: "".tr,
          iconData: Icons.phone_outlined,
          controller: controller.phoneNumber,
          min: 10,
          max: 15,
          padding: 10,
          isNumber: true,
          isLabel: false,
          isPassword: false,
          isBorder: true,
          isFilled: true,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 10.h),
          child: Text(
            controller.isFreelancer ? "bio".tr : "aboutcompany".tr,
            style: TextStyles.w50014(context),
          ),
        ),
        Visibility(
          visible: !controller.isFreelancer,
          child: Customtextformfiled(
            hintText: "",
            padding: 10,

            labelText: "",
            iconData: Icons.info_outline,
            controller: controller.description,
            min: 10,
            max: 200,
            isNumber: false,
            isFilled: true,
            isLabel: false,
            isPassword: false,
            //letters: 150,
            maxLines: 4,
            isValidation: true,
          ),
        ),
        Visibility(
          visible: controller.isFreelancer,
          child: Customtextformfiled(
            hintText: "",
            labelText: "",
            iconData: Icons.info_outline,
            controller: controller.bio,
            min: 10,
            max: 200,
            isNumber: false,
            isLabel: false,
            isFilled: true,
            isPassword: false,
            maxLines: 4,
            isValidation: true,
          ),
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
                  color: Theme.of(context).colorScheme.primaryContainer),
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
        SizedBox(
          height: 5.h,
        )
      ],
    );
  }
}
