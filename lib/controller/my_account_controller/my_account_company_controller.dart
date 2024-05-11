import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/add_project_or_product_back.dart';
import 'package:joblance/data/remote/company/company_profile.dart';

abstract class MyAccountCompanyController extends GetxController {
  getUserData();
  getProduts();
}

class MyAccountCompanyControllerImpl extends MyAccountCompanyController {
  StatusRequest? statusRequest;
  AddProjectOrProductBack addProjectOrProductBack = AddProjectOrProductBack(Get.put(Crud()));
  CompanyAccount companyAccount = new CompanyAccount(Get.put(Crud()));
  Myservices myServices = Get.find();
  Map data = {};
  List products = [];
  late String token, id;
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
  @override
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    id = myServices.sharedPreferences.getInt("id")!.toString();
    getUserData();
    getProduts();
    super.onInit();
  }

  getUserData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await companyAccount.getData(token, id);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        print(response['data']);
      }
    }
    update();
  }

  getProduts() async {
    var response =
        await addProjectOrProductBack.getData({}, AppLinks.project, token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        products.addAll(response['data']);
      }
    }
    update();
  }

  void dispose() {
    super.dispose();
  }
}
