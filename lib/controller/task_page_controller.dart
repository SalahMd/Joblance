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
import 'package:joblance/view/screens/add_task/add_task.dart';

abstract class TaskPageController extends GetxController {
  getData();
  updateTask();
  deleteData();
}

class TaskPageControllerImpl extends TaskPageController {
  final int id, taskId;
  final BuildContext context;
  StatusRequest? statusRequest, updateStatus;
  late String token,lang;
  TaskModel task = TaskModel();
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late int userId;
  bool isEditing = false, isOwner = false;
  Myservices myServices = Get.find();
  TaskPageControllerImpl(this.context,
      {required this.taskId, required this.id});
  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    update();
    token = myServices.sharedPreferences.getString("token")!;
    lang = myServices.sharedPreferences.getString("lang")!;
    userId = myServices.sharedPreferences.getInt("id")!;
    if (userId == id) {
      isOwner = true;
    }
    await getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await taskBack
        .getData({}, AppLinks.task + "/" + taskId.toString()+"?lang="+lang, token);
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
        snackBar("", "yourtaskhasbeendeleted".tr, context);
        Get.back();
      } else {
        animationedAlert(AppAnimations.wrong, "couldn'tdelete".tr);
      }
    } else {
      animationedAlert(AppAnimations.wrong, "couldn'tdelete".tr);
    }
  }

  @override
  updateTask() {
    Get.to(
        AddTask(
          isUpdate: true, image: task.image!,name: task.name!,
        ),
        arguments: {
          "about_task": task.aboutTask,
          "task_title": task.taskTitle,
          "requirements": task.requirements,
          "additional_information": task.additionalInformation,
          "task_duration": task.taskDuration,
          "budget_min": task.budgetMin,
          "budget_max": task.budgetMax,
          "id": task.id,
          "major_id":task.majorId,
          "active":task.active==1?true:false,
        });
  }
}
