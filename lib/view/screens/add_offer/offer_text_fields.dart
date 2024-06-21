import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_offer_controller.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/text_styles.dart';

class OfferTextFields extends StatelessWidget {
  final AddOfferControllerImpl controller;
  const OfferTextFields({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                child: Customtextformfiled(
              hintText: "firstname2".tr,
              labelText: "",
              iconData: null,
              controller: controller.firstName,
              min: 3,
              max: 10,
              isNumber: false,
              isPassword: false,
              isBorder: true,
              isLabel: false,
              isFilled: true,
            )),
            Expanded(
                child: Customtextformfiled(
              hintText: "lastname2".tr,
              labelText: "",
              iconData: null,
              controller: controller.lastName,
              min: 3,
              max: 10,
              isNumber: false,
              isPassword: false,
              isBorder: true,
              isLabel: false,
              isFilled: true,
            ))
          ],
        ),
        Customtextformfiled(
          hintText: "email1".tr,
          labelText: "",
          iconData: Icons.mail_outline,
          controller: controller.email,
          min: 10,
          max: 35,
          isNumber: false,
          isPassword: false,
          isBorder: true,
          isFilled: true,
          isLabel: false,
        ),
        Customtextformfiled(
          hintText: "phone1".tr,
          labelText: "",
          iconData: Icons.phone_outlined,
          controller: controller.phoneNumber,
          min: 10,
          max: 15,
          isNumber: true,
          isPassword: false,
          isFilled: true,
          isBorder: true,
          isLabel: false,
        ),
        Row(
          children: [
            Expanded(
                flex: 3,
                child: Customtextformfiled(
                  hintText: "offerbudget".tr,
                  labelText: "",
                  iconData: null,
                  controller: controller.offerBudget,
                  min: 1,
                  max: 6,
                  isNumber: true,
                  isPassword: false,
                  isBorder: true,
                  isLabel: false,
                  isFilled: true,
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: 12.h, end: 20.w),
                  child: Center(
                    child: Text(
                      "\$",
                      style: TextStyles.w50014(context),
                    ),
                  ),
                ))
          ],
        ),
        Row(
          children: [
            Expanded(
                flex: 3,
                child: Customtextformfiled(
                  hintText: "yearsofexperience".tr,
                  labelText: "",
                  iconData: null,
                  controller: controller.yearsOfExperience,
                  min: 1,
                  max: 3,
                  isNumber: true,
                  isPassword: false,
                  isBorder: true,
                  isLabel: false,
                  isFilled: true,
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: 12.h, start: 10.w),
                  child: Text(
                    "years".tr,
                    style: TextStyles.w50014(context),
                  ),
                ))
          ],
        ),
        Row(
          children: [
            Expanded(
                flex: 3,
                child: Customtextformfiled(
                  hintText: "excutingtime".tr,
                  labelText: "",
                  iconData: null,
                  controller: controller.excutingTime,
                  min: 1,
                  max: 3,
                  isNumber: true,
                  isPassword: false,
                  isBorder: true,
                  isLabel: false,
                  isFilled: true,
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: 12.h, start: 10.w),
                  child: Text(
                    "days".tr,
                    style: TextStyles.w50014(context),
                  ),
                ))
          ],
        ),
        Customtextformfiled(
          hintText: "offerinfo".tr,
          labelText: "",
          iconData: null,
          controller: controller.offerInformation,
          min: 5,
          max: 400,
          isNumber: false,
          isValidation: false,
          isPassword: false,
          isBorder: false,
          isLabel: false,
          isFilled: true,
          textInputAction: TextInputAction.newline,
          minLines: 4,
          maxLines: 6,
        ),
      ],
    );
  }
}
