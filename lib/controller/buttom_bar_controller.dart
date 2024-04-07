import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/view/screens/home_page/company_home_page/company_home_page.dart';
import 'package:joblance/view/screens/messages.dart';
import 'package:joblance/view/screens/my_account/freelancer/my_aacount_freelancer.dart';
import 'package:joblance/view/screens/my_account/company/my_account_company.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/freelancer_home_page.dart';
import 'package:joblance/view/screens/settings/settings.dart';

abstract class ButtomBarController extends GetxController {
  changePage(int index);
  changeButtonState();
}

class ButtomBarControllerImp extends ButtomBarController {
  Myservices myServices = Get.find();
  late var role;
  bool isOpen = false;
  int currentPage = 1;
  List<Widget> listPage = [];
  @override
  changePage(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    role = myServices.sharedPreferences.getString("role_id");
    if (role == "1") {
      listPage = [
        const MyAccountCompany(),
        CompanyHomePage(),
        Messages(),
        const Settings(),
      ];
    } else {
      listPage = [
        const MyAccountFreeLancer(),
        FreelancerHomePage(),
        Messages(),
        const Settings(),
      ];
    }
    super.onInit();
  }

  changeButtonState() {
    isOpen = !isOpen;
    update();
  }
}
