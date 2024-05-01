import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/freelancer_info_model.dart';
import 'package:joblance/data/remote/profile_back.dart';

abstract class FreelancerProfileController extends GetxController {}

class FreelancerProfileControllerImpl extends FreelancerProfileController {
  StatusRequest? statusRequest;
  List<FreeLancerInfoModel> info = [];
  final int id;
  Myservices myServices = Get.find();
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

  FreelancerProfileControllerImpl({required this.id});
  displayData() async {
    statusRequest = StatusRequest.loading;
    var token = myServices.sharedPreferences.getString("token");
    var response = await profileBack.getData(token, id.toString());
    statusRequest = handelingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        info.add(FreeLancerInfoModel(
            response['data']['id'],
            response['data']['name'],
            response['data']['major'],
            response['data']['image'],
            response['data']['study_case'],
            response['data']['email'],
            response['data']['phone_number'],
            [],
            response['data']['bio'],
            response['data']['location'],
            response['data']['open_to_work'],
            response['data']['followers'],
            response['data']['cover_photo']));
        print(data);
      }
    }
    update();
  }

  @override
  void onInit() {
    //displayData();
    super.onInit();
  }
}
