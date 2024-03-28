import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_project_or_product_controller.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/text_styles.dart';

class ProjectOrProductTextFileds extends StatelessWidget {
  final AddProjectOrProductImpl controller;
  ProjectOrProductTextFileds({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w),
          child: Text(
            controller.isProduct ? "producttitle".tr : "projecttitle",
            style: TextStyles.w50014(context),
          ),
        ),
        Customtextformfiled(
          hintText: controller.isProduct ? "producttitle2".tr : "projecttitle2",
          labelText: "".tr,
          iconData: null,
          controller: controller.title,
          min: 2,
          max: 20,
          isNumber: false,
          isPassword: false,
          isBorder: false,
          isLabel: false,
          isFilled: true,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
          child: Text(
            controller.isProduct
                ? "productdescription".tr
                : "projectdescription",
            style: TextStyles.w50014(context),
          ),
        ),
        Customtextformfiled(
          hintText: controller.isProduct
              ? "productdescription2".tr
              : "projectdescription2",
          labelText: "".tr,
          iconData: null,
          controller: controller.description,
          min: 5,
          max: 200,
          maxLines: 4,
          isNumber: false,
          isPassword: false,
          isBorder: false,
          isLabel: false,
          isFilled: true,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
          child: Text(
            "link".tr,
            style: TextStyles.w50014(context),
          ),
        ),
        Customtextformfiled(
          hintText: "addyourlink".tr,
          labelText: "".tr,
          iconData: null,
          controller: controller.link,
          min: 10,
          max: 100,
          isNumber: false,
          isPassword: false,
          isBorder: false,
          isLabel: false,
          isFilled: true,
        ),
      ],
    );
  }
}
