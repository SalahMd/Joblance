import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/view/screens/messages.dart';
import 'package:joblance/view/screens/profile/freelancer_profile.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/freelancer_home_page.dart';
import 'package:joblance/view/screens/settings/settings.dart';

abstract class ButtomBarController extends GetxController {
  changePage(int index);
}

class ButtomBarControllerImp extends ButtomBarController {
  int currentPage = 1;
  List<Widget> listPage = [const FreelancerProfile(),  FreelancerHomePage(),Messages(), const Settings(),];
  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
