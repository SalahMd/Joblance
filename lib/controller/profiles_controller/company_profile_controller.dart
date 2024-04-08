import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/profile_back.dart';

abstract class CompanyProfileController extends GetxController {}

class CompanyProfileControllerImpl extends CompanyProfileController {
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
    Tab(text: "about".tr),
    Tab(text: "products".tr),
    Tab(text: "contact".tr)
  ];
  ProfileBack profileBack = new ProfileBack(Get.put(Crud()));
  displayData() async {
    statusRequest = StatusRequest.loading;
    var token = myServices.sharedPreferences.getString("token");
    var response = await profileBack.postData(token, 3.toString());
    statusRequest = hadelingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        print(data);
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
