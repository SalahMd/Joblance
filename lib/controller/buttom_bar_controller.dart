import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/profile_back.dart';
import 'package:joblance/view/screens/home_page/company_home_page/company_home_page.dart';
import 'package:joblance/view/screens/my_account/freelancer/my_aacount_freelancer.dart';
import 'package:joblance/view/screens/my_account/company/my_account_company.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/freelancer_home_page.dart';
import 'package:joblance/view/screens/notifications.dart';
import 'package:joblance/view/screens/settings/settings.dart';

abstract class ButtomBarController extends GetxController {
  changePage(int index);
  changeButtonState();
  getSubscription();
}

class ButtomBarControllerImp extends ButtomBarController {
  Myservices myServices = Get.find();
  late var role;
  bool isOpen = false;
  int currentPage = 1;
  List<Widget> listPage = [];
  String? name, image, lang, token, id;
  StatusRequest? statusRequest;
  bool subscribed = true;
  ProfileBack profileBack = new ProfileBack(Get.put(Crud()));
  @override
  changePage(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    update();
    role = myServices.sharedPreferences.getString("role_id");
    id = myServices.sharedPreferences.getInt("id")!.toString();
    lang = myServices.sharedPreferences.getString("lang")!;
    token = myServices.sharedPreferences.getString("token")!;
    getUserInfo();
    if (role == "1") getSubscription();

    if (role == "1") {
      listPage = [
        const MyAccountCompany(),
        CompanyHomePage(),
        Notifications(),
        const Settings(),
      ];
    } else {
      listPage = [
        const MyAccountFreeLancer(),
        FreelancerHomePage(),
        Notifications(),
        const Settings(),
      ];
    }

    super.onInit();
  }

  changeButtonState() {
    isOpen = !isOpen;
    update();
  }

  getUserInfo() async {
    var response = await profileBack.getData(token, id!, lang!);
    statusRequest = handelingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (role == "1")
          name = response['data']['name'];
        else
          name = response['data']['first_name'] +
              " " +
              response['data']['last_name'];
        image = response['data']['image'];
      }
    }
    update();
  }

  getSubscription() async {
    statusRequest = StatusRequest.loading;
    var response = await profileBack.getSubscription(token!, lang!);
    statusRequest = handelingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data'] == 'This user does not have active subscription') {
          subscribed = false;
        } else {}
      }
    }
    update();
  }
}
