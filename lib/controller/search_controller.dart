import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/search_back.dart';

abstract class SearchController extends GetxController {
  dispDatat();
  filterData();
}

class SearchControllerImpl extends SearchController {
  bool isJob = false;
  StatusRequest? statusRequest;
  Myservices myservices = Get.find();
  late String lang, token;
  SearchBack searchBack = new SearchBack(Get.put(Crud()));

   List<DropdownMenuItem<String>> jobExperience = [];

  List<DropdownMenuItem<String>> majors = [];
  void onInit() async {
     lang = myservices.sharedPreferences.getString("lang")!;
    token = myservices.sharedPreferences.getString("token")!;
    super.onInit();
  }

  getMajors() async {
    statusRequest = StatusRequest.loading;
    var response = await searchBack.getMajor(token, lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
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
  }

  getExperience() async {
    statusRequest = StatusRequest.loading;
    var response = await searchBack.getExperience(token, lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (int i = 0; i < response['data'].length; i++) {
          jobExperience.add(DropdownMenuItem(
            value: response['data'][i]['id'].toString(),
            child: Text(response['data'][i]['name']),
          ));
        }
        print(majors);
      }
    }
    update();
  }

  @override
  dispDatat() {}

  @override
  filterData() {}
}
