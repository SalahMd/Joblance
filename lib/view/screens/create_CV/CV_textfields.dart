import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/create_CV_controller.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/create_CV/lists.dart';

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
            hintText: "email1".tr,
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
            hintText: "phone1".tr,
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
            hintText: "summary".tr,
            labelText: "",
            iconData: null,
            controller: controller.summary,
            min: 5,
            max: 300,
            maxLines: 3,
            textInputAction: TextInputAction.newline,
            isValidation: true,
            isNumber: false,
            isPassword: false,
            isBorder: true,
            isFilled: true,
            isLabel: false,
          ),
          CVLists(
            title: "skills".tr,
            textfieldTitle: "skill".tr,
            list: controller.skills,
            onAddTap: controller.addSkill,
            withDate: false,
            controller: controller,
          ),
          CVLists(
            title: "certificates".tr,
            textfieldTitle: "certificate".tr,
            list: controller.certificates,
            withDate: false,
            onAddTap: controller.addCertificate,
            controller: controller,
          ),
          CVLists(
              title: "educations".tr,
              textfieldTitle: "education".tr,
              list: controller.education,
              onAddTap: controller.addEducation,
              controller: controller,
              withDate: true,
              dates: controller.edcationDates),
              CVLists(
              title: "experiences".tr,
              textfieldTitle: "experience".tr,
              list: controller.experiences,
              onAddTap: controller.addExperience,
              controller: controller,
              withDate: true,
              years: controller.years,
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
        ],
      ),
    );
  }
}
