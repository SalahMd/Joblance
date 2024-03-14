import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/view/screens/profile/freelancer_profile.dart';
import 'package:joblance/view/screens/favorite.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/freelancer_home_page.dart';



abstract class ButtomBarController extends GetxController {
  changePage(int index);
}

class ButtomBarControllerImp extends ButtomBarController {
  int currentPage = 1;
  List<Widget> listPage = [const FreelancerProfile(), const FreelancerHomePage(), const Favorite(),];
  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
