import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/view/screens/home_page/company_home_page/company_home_page.dart';
import 'package:joblance/view/screens/messages.dart';
import 'package:joblance/view/screens/profile/company_profile/company_profile.dart';
import 'package:joblance/view/screens/profile/freelancer_profile/freelancer_profile.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/freelancer_home_page.dart';
import 'package:joblance/view/screens/settings/settings.dart';

abstract class ButtomBarController extends GetxController {
  changePage(int index);
}

class ButtomBarControllerImp extends ButtomBarController {
  Myservices myServices = Get.find();
  late var role;
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
    if (role == "3") {
      listPage = [
        const FreelancerProfile(),
        FreelancerHomePage(),
        Messages(),
        const Settings(),
      ];
    } else {
      listPage = [
        const CompanyProfile(),
        CompanyHomePage(),
        Messages(),
        const Settings(),
      ];
    }
    super.onInit();
  }
}
