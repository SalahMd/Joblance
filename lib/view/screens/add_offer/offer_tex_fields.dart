import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_offer_controller.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';

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
          isPassword: true,
          isFilled: true,
          isBorder: true,
          isLabel: false,
        ),
        Row(
          children: [
            Expanded(
                child: Customtextformfiled(
              hintText: "offerbudget".tr,
              labelText: "",
              iconData: null,
              controller: controller.offerBudget,
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
              hintText: "excutingtime".tr,
              labelText: "",
              iconData: null,
              controller: controller.duration,
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
          hintText: "offerinfo".tr,
          labelText: "",
          iconData: null,
          controller: controller.offerInformation,
          min: 10,
          max: 300,
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