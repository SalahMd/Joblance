import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/images.dart';

abstract class AddTaskController extends GetxController {
  updateDropDownValue(String? newValue, String changingElement);
}

class AddTaskControllerImpl extends AddTaskController {
  late TextEditingController aboutTask;
  late TextEditingController additionalInfo;
  late TextEditingController requirements;
  late TextEditingController budget;
  late TextEditingController taskTitle;
  late TextEditingController taskLocation;
  late TextEditingController taskDuration;

  bool showNumOfEmployees = false;
  bool showAboutCompany = false;
  String taskMajorValue = "1";
  List<DropdownMenuItem<String>> major = [
    DropdownMenuItem<String>(
      value: '1',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("engineering".tr),
          Container(
            width: 25.w,
            height: 25.h,
            child: Image.asset(
              AppImages.cat3,
              width: 25.w,
              height: 25.h,
            ),
          )
        ],
      ),
    ),
    DropdownMenuItem<String>(
      value: '2',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("technology".tr),
          Container(
            width: 25.w,
            height: 25.h,
            child: Image.asset(
              AppImages.cat5,
              width: 25.w,
              height: 25.h,
            ),
          )
        ],
      ),
    ),
    DropdownMenuItem<String>(
      value: '3',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("medical".tr),
          Container(
            width: 25.w,
            height: 25.h,
            child: Image.asset(
              AppImages.cat4,
              width: 25.w,
              height: 25.h,
            ),
          )
        ],
      ),
    ),
    DropdownMenuItem<String>(
      value: '4',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("designing".tr),
          Container(
            width: 25.w,
            height: 25.h,
            child: Image.asset(
              AppImages.cat2,
              width: 25.w,
              height: 25.h,
            ),
          )
        ],
      ),
    ),
    DropdownMenuItem<String>(
      value: '5',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("customer-service".tr),
          Container(
            width: 25.w,
            height: 25.h,
            child: Image.asset(
              AppImages.cat6,
              width: 25.w,
              height: 25.h,
            ),
          )
        ],
      ),
    ),
  ];

  @override
  onInit() {
    aboutTask = new TextEditingController();
    additionalInfo = new TextEditingController();
    requirements = new TextEditingController();
    budget = new TextEditingController();
    taskLocation = new TextEditingController();
    taskTitle = new TextEditingController();
    taskDuration = new TextEditingController();
    super.onInit();
  }

  @override
  dispose() {
    aboutTask.dispose();
    additionalInfo.dispose();
    requirements.dispose();
    budget.dispose();
    taskLocation.dispose();
    taskTitle.dispose();
    taskDuration.dispose();
    super.dispose();
  }

  changeCheckBoxValue(String box) {
    if (box == "aboutcompany")
      showAboutCompany = !showAboutCompany;
    else if (box == "showemployees") showNumOfEmployees = !showNumOfEmployees;
    update();
  }

  @override
  updateDropDownValue(String? newValue, String changingElement) {
    update();
  }
}
