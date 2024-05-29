import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/task_back.dart';

abstract class AddTaskController extends GetxController {
  updateDropDownValue(String? newValue, String changingElement);
}

class AddTaskControllerImpl extends AddTaskController {
  late TextEditingController aboutTask;
  late TextEditingController additionalInfo;
  late TextEditingController requirements;
  late TextEditingController minBudget;
  late TextEditingController maxBudget;
  late TextEditingController taskTitle;
  late TextEditingController taskLocation;
  late TextEditingController taskDuration;
  Myservices myservices = Get.find();
  StatusRequest? statusRequest;
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
  late String token;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  @override
  onInit() {
    token = myservices.sharedPreferences.getString("token")!;
    aboutTask = new TextEditingController();
    additionalInfo = new TextEditingController();
    requirements = new TextEditingController();
    minBudget = new TextEditingController();
    maxBudget = new TextEditingController();
    taskLocation = new TextEditingController();
    taskTitle = new TextEditingController();
    taskDuration = new TextEditingController();
    super.onInit();
  }

  postTask(BuildContext context) async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "pleasewait".tr);
      var response = await taskBack.postData({
        "about_task": aboutTask.text,
        "task_title": taskTitle.text,
        "requirements": requirements.text,
        "additional_information": additionalInfo.text,
        "task_duration": taskDuration.text,
        "budget_min": minBudget.text,
        "budget_max": maxBudget.text
      }, token);
      statusRequest = handelingData(response);
      Get.back();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();
          snackBar("", "yourtaskhasbeenposted".tr, context);
        }else{
          snackBar("", "couldn'tpostyourtask".tr, context);
        }
      }else{
        snackBar("", "couldn'tpostyourtask".tr, context);
      }
    }
  }

  @override
  dispose() {
    aboutTask.dispose();
    additionalInfo.dispose();
    requirements.dispose();
    minBudget.dispose();
    maxBudget.dispose();
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
