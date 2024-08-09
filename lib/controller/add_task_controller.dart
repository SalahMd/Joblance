import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/company/company_home_page_back.dart';
import 'package:joblance/data/remote/profile_back.dart';
import 'package:joblance/data/remote/task_back.dart';

abstract class AddTaskController extends GetxController {
  updateDropDownValue(String? newValue, String changingElement);
  postTask(BuildContext context, bool isUpdate);
}

class AddTaskControllerImpl extends AddTaskController {
  late TextEditingController aboutTask,
      additionalInfo,
      requirements,
      minBudget,
      maxBudget,
      taskTitle,
      taskDuration;
  TextDirection direction = TextDirection.ltr;
  CompanyHomePageBack companyHomePageBack =
      CompanyHomePageBack(Get.put(Crud()));
  Myservices myservices = Get.find();
  StatusRequest? statusRequest, majorStatus;
  int? id;
  bool showNumOfEmployees = false, active = true;
  String taskMajorValue = "1";
  late String lang, token, userId;
  List<DropdownMenuItem<String>> majors = [];
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  ProfileBack profileBack = new ProfileBack(Get.put(Crud()));

  @override
  onInit() async {
    token = myservices.sharedPreferences.getString("token")!;
    lang = myservices.sharedPreferences.getString("lang")!;
    aboutTask = new TextEditingController();
    additionalInfo = new TextEditingController();
    requirements = new TextEditingController();
    minBudget = new TextEditingController();
    maxBudget = new TextEditingController();
    taskTitle = new TextEditingController();
    taskDuration = new TextEditingController();
    await getMajors();

    if (Get.arguments != null) {
      taskTitle.text = Get.arguments['task_title'] as String;
      aboutTask.text = Get.arguments['about_task'] as String;
      requirements.text = Get.arguments['requirements'] as String;
      taskDuration.text = Get.arguments['duration'].toString();
      minBudget.text = Get.arguments['budget_min'].toString();
      maxBudget.text = Get.arguments['budget_max'].toString();
      active = Get.arguments['active'];
      taskMajorValue = Get.arguments['major_id'].toString();
      id = Get.arguments['id'];
      if (Get.arguments['additional_information'] != null) {
        additionalInfo.text = Get.arguments['additional_information'] as String;
      }
    }
    super.onInit();
  }

  getMajors() async {
    majorStatus = StatusRequest.loading;
    var response = await companyHomePageBack.getMajor(token, lang);
    majorStatus = handelingData(response);
    if (StatusRequest.success == majorStatus) {
      if (response['status'] == "success") {
        for (int i = 0; i < response['data'].length; i++) {
          majors.add(DropdownMenuItem(
            value: response['data'][i]['id'].toString(),
            child: Text(response['data'][i]['name']),
          ));
        }
        print(majors);
      }
    }
    update();
  }

  postTask(BuildContext context, bool isUpdate) async {
    var formdata = formState.currentState;
    if (int.parse(minBudget.text) > int.parse(maxBudget.text)) {
      animationedAlert(AppAnimations.wrong, "minbudgetcantbehigherthanmax".tr);
      return;
    }
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "pleasewait".tr);
      Map data = {
        "about_task": aboutTask.text,
        "task_title": taskTitle.text,
        "requirements": requirements.text,
        "additional_information": additionalInfo.text,
        "duration": taskDuration.text,
        "budget_min": minBudget.text,
        "budget_max": maxBudget.text,
        "major_id": taskMajorValue,
        "active": active ? "1" : "0",
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
      print(response);
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

  changeTaskStatus() {
    active = !active;
    update();
  }
}
