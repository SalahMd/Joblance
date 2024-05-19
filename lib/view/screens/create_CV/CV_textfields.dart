import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/create_CV_controller.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';

class CVTextFields extends StatelessWidget {
  final CreateCVControllerImpl controller;
  const CVTextFields({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formState,
      child: Column(
        children: [
          Customtextformfiled(
            hintText: "enteryourfullname".tr,
            labelText: "",
            iconData: null,
            controller: controller.fullName,
            min: 3,
            max: 30,
            isNumber: false,
            isPassword: false,
            isBorder: true,
            isFilled: true,
            isLabel: false,
          ),
          Customtextformfiled(
            hintText: "email".tr,
            labelText: "",
            iconData: null,
            controller: controller.email,
            min: 10,
            max: 50,
            isNumber: false,
            isPassword: false,
            isBorder: true,
            isFilled: true,
            isLabel: false,
          ),
          Customtextformfiled(
            hintText: "email".tr,
            labelText: "",
            iconData: null,
            controller: controller.email,
            min: 10,
            max: 50,
            isNumber: false,
            isPassword: false,
            isBorder: true,
            isFilled: true,
            isLabel: false,
          ),
          Customtextformfiled(
            hintText: "major".tr,
            labelText: "",
            iconData: null,
            controller: controller.major,
            min: 2,
            max: 20,
            isNumber: false,
            isPassword: false,
            isBorder: true,
            isFilled: true,
            isLabel: false,
          ),
           Customtextformfiled(
            hintText: "phone".tr,
            labelText: "",
            iconData: null,
            controller: controller.phoneNumber,
            min: 10,
            max: 15,
            isNumber: true,
            isPassword: false,
            isBorder: true,
            isFilled: true,
            isLabel: false,
          ),
           Customtextformfiled(
            hintText: "link".tr,
            labelText: "",
            iconData: null,
            controller: controller.link,
            min: 5,
            max: 200,
            isValidation: false,
            isNumber: true,
            isPassword: false,
            isBorder: true,
            isFilled: true,
            isLabel: false,
          ),
          Customtextformfiled(
            hintText: "skills".tr,
            labelText: "",
            iconData: null,
            controller: controller.skills,
            min: 3,
            max: 200,
            isNumber: true,
            isPassword: false,
            isBorder: true,
            isFilled: true,
            isLabel: false,
          ),
        ],
      ),
    );
  }
}
