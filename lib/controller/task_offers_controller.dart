import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/task_back.dart';

abstract class TaskOffersController extends GetxController {
  getOffers();
  acceptUser(int index, BuildContext context);
  getTaskStatus();
}

class TaskOffersControllerImpl extends TaskOffersController {
  StatusRequest? statusRequest, acceptStatus;
  late String token, lang;
  final String id;
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  Myservices myServices = Get.find();
  List data = [];
  String status = '';

  TaskOffersControllerImpl({required this.id});
  void onInit() async {
    token = myServices.sharedPreferences.getString("token")!;
    lang = myServices.sharedPreferences.getString("lang")!;
    await getOffers();
    await getTaskStatus();
    super.onInit();
  }

  getTaskStatus() async {
    statusRequest = StatusRequest.loading;
    var response = await taskBack.getTaskStatus(token, id, lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if(response['data'].isNotEmpty)
        status = response['data'][0]['task_state_name'];
      }
    }
    update();
  }

  @override
  getOffers() async {
    statusRequest = StatusRequest.loading;
    var response = await taskBack.getOffers(token, id, lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      }
    }
    update();
  }

  @override
  acceptUser(int index, BuildContext context) async {
    acceptStatus = StatusRequest.loading;
    animationedAlert(AppAnimations.loadings, "pleasewait".tr);
    var response = await taskBack.acceptUser({
      "user_id": data[index]['user_id'].toString(),
      "task_id": data[index]['task_id'].toString(),
      "duration": data[index]['excuting_time'].toString()
    }, token);
    acceptStatus = handelingData(response);
    Get.back();
    if (StatusRequest.success == acceptStatus) {
      if (response['status'] == "success") {
        Get.back();
        snackBar("", "userhasbeenaccepted".tr, context);
      } else {
        animationedAlert(AppAnimations.wrong, "couldn'tacceptuser".tr);
      }
    } else {
      animationedAlert(AppAnimations.wrong, "couldn'tacceptuser".tr);
    }
    update();
  }
}
