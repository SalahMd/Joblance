import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/profile_back.dart';

abstract class MyAccountCompanyController extends GetxController {}

class MyAccountCompanyControllerImpl extends MyAccountCompanyController {
  StatusRequest? statusRequest;
  Myservices myServices = Get.find();
  List data = [];
  List<Widget> tabs = [
    Tab(
      text: "jobs".tr,
    ),
     Tab(
      text: "tasks".tr,
    ),
    Tab(text: "products".tr),
    Tab(
      text: "about".tr,
    ),
    Tab(text: "contact".tr),
  ];
  ProfileBack profileBack = new ProfileBack(Get.put(Crud()));
  displayData() async {}

  @override
  void onInit() {
    super.onInit();
  }

  void dispose() {
    super.dispose();
  }
}
