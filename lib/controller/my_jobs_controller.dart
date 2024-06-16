import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/profile_back.dart';

abstract class MyJobsController extends GetxController {
  getSavedJobs();
}

class MyJobsControllerImpl extends MyJobsController {
  StatusRequest? statusRequest;
  Myservices myServices = Get.find();
  List data = [];
  List<Widget> tabs = [
    Tab(
      text: "savedjobs".tr,
    ),
    Tab(text: "applaiedjobs".tr),
  ];
  ProfileBack profileBack = new ProfileBack(Get.put(Crud()));

  @override
  void onInit() {
    getSavedJobs();
    super.onInit();
  }

  getSavedJobs() async {

  }
}
