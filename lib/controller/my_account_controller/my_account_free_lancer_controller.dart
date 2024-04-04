import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/profile_back.dart';

abstract class MyAccountFreelancerController extends GetxController {}

class MyAccountFreelancerControllerImpl extends MyAccountFreelancerController {
  StatusRequest? statusRequest;
  Myservices myServices = Get.find();
  late TextEditingController skill;
  List data = [];
  List<Widget> tabs = [
    Tab(
      text: "about".tr,
    ),
    Tab(text: "projects".tr),
    Tab(
      text: "skills".tr,
    ),
    Tab(text: "contact".tr),
  ];
  ProfileBack profileBack = new ProfileBack(Get.put(Crud()));
  displayData() async {}

  @override
  void onInit() {
    //displayData();
    skill = new TextEditingController();
    super.onInit();
  }

  void dispose() {
    skill.dispose();
    super.dispose();
  }
}
