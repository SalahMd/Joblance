import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/task_model.dart';
import 'package:joblance/data/remote/task_back.dart';

abstract class TaskPageController extends GetxController {
  getData();
  updateTask();
  deleteData();
}

class TaskPageControllerImpl extends TaskPageController {
  final int id, taskId;
  final BuildContext context;
  late TextEditingController aboutTask;
  late TextEditingController additionalInfo;
  late TextEditingController requirements;
  late TextEditingController minBudget;
  late TextEditingController maxBudget;
  late TextEditingController taskTitle;
  late TextEditingController taskLocation;
  late TextEditingController taskDuration;
  StatusRequest? statusRequest, updateStatus;
  late String token;
  late TaskModel task;
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late int userId;
  bool isEditing = false, isOwner = false;
  Myservices myServices = Get.find();
  TaskPageControllerImpl(this.context,
      {required this.taskId, required this.id});
  @override
  void onInit() async {
    aboutTask = new TextEditingController();
    additionalInfo = new TextEditingController();
    requirements = new TextEditingController();
    minBudget = new TextEditingController();
    maxBudget = new TextEditingController();
    taskLocation = new TextEditingController();
    taskTitle = new TextEditingController();
    taskDuration = new TextEditingController();
    token = myServices.sharedPreferences.getString("token")!;
    userId = myServices.sharedPreferences.getInt("id")!;
    if (userId == id) {
      isOwner = true;
    }
    await getData();
    super.onInit();
  }

  void dispose() {
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

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await taskBack
        .getData({}, AppLinks.task + "/" + taskId.toString(), token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        task = TaskModel.fromJson(response['data']);
      }
    } else {
      Get.back();
      animationedAlert(AppAnimations.wrong, "couldn'tloadinfo".tr);
    }
    update();
  }

  @override
  deleteData() async {
    Get.back();
    var response = await taskBack.deleteData(taskId.toString(), token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.back();
      } else {
        animationedAlert(AppAnimations.wrong, "couldn'tdelete".tr);
      }
    } else {
      animationedAlert(AppAnimations.wrong, "couldn'tdelete".tr);
    }
  }

  @override
  updateTask() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      updateStatus = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "pleasewait".tr);
      var response = await taskBack.updateData({
        "about_task": aboutTask.text,
        "task_title": taskTitle.text,
        "requirements": requirements.text,
        "additional_information": additionalInfo.text,
        "task_duration": taskDuration.text,
        "budget_min": minBudget.text,
        "budget_max": maxBudget.text
      }, token, taskId.toString());
      updateStatus = handelingData(response);
      Get.back();
      if (StatusRequest.success == updateStatus) {
        if (response['status'] == "success") {
          Get.back();

          snackBar("", "yourtaskhasbeenupdated".tr, context);
        } else {
          Get.back();
          animationedAlert(AppAnimations.wrong, "e".tr);
        }
      } else {
        Get.back();
        animationedAlert(AppAnimations.wrong, "errorwhilesavingdata".tr);
      }
    }
  }
}
