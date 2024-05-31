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
  postTask(BuildContext context, bool isUpdate);
}

class AddTaskControllerImpl extends AddTaskController {
  late TextEditingController aboutTask;
  late TextEditingController additionalInfo;
  late TextEditingController requirements;
  late TextEditingController minBudget;
  late TextEditingController maxBudget;
  late TextEditingController taskTitle;
  late TextEditingController taskDuration;
  TextDirection direction = TextDirection.ltr;
  Myservices myservices = Get.find();
  StatusRequest? statusRequest;
  int? id;
  bool showNumOfEmployees = false;
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
    taskTitle = new TextEditingController();
    taskDuration = new TextEditingController();
    if (Get.arguments != null) {
      taskTitle.text = Get.arguments['task_title'] as String;
      aboutTask.text = Get.arguments['about_task'] as String;
      requirements.text = Get.arguments['requirements'] as String;
      taskDuration.text = Get.arguments['task_duration'].toString();
      minBudget.text = Get.arguments['budget_min'].toString();
      maxBudget.text = Get.arguments['budget_max'].toString();
      id = Get.arguments['id'];
      if (Get.arguments['additional_information'] != null) {
        additionalInfo.text = Get.arguments['additional_information'] as String;
      }
    }

    super.onInit();
  }

  postTask(BuildContext context, bool isUpdate) async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "pleasewait".tr);
      Map data = {
        "about_task": aboutTask.text,
        "task_title": taskTitle.text,
        "requirements": requirements.text,
        "additional_information": additionalInfo.text,
        "task_duration": taskDuration.text,
        "budget_min": minBudget.text,
        "budget_max": maxBudget.text
      };
      var response;
      if (!isUpdate)
        response = await taskBack.postData(data, token);
      else
        response = await taskBack.updateData(data, token, id.toString());
      statusRequest = handelingData(response);
      Get.back();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();

          snackBar(
              "",
              !isUpdate
                  ? "yourtaskhasbeenposted".tr
                  : "yourtaskhasbeenupdated".tr,
              context);
        } else {
          snackBar(
              "",
              !isUpdate
                  ? "couldn'tpostyourtask".tr
                  : "couldn'tupdateyourtask".tr,
              context);
        }
      } else {
        snackBar(
            "",
            !isUpdate ? "couldn'tpostyourtask".tr : "couldn'tupdateyourtask".tr,
            context);
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
    taskTitle.dispose();
    taskDuration.dispose();
    super.dispose();
  }

  @override
  updateDropDownValue(String? newValue, String changingElement) {
    taskMajorValue = newValue!;
    update();
  }
}
