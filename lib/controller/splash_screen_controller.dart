import 'dart:async';
import 'package:get/get.dart';
import 'package:joblance/controller/buttom_bar_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/view/screens/choose_language.dart';

abstract class SplashScreenController extends GetxController {
  startTimer();
}

class SplashScreenControllerImpl extends SplashScreenController {
  int timer = 2;
  late Timer countdownTimer;
 late ButtomBarControllerImp controller;
  Myservices myservices = Get.find();

  @override
  void startTimer() {
    timer = 2;
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (this.timer == 0) {
        timer.cancel();
        if (controller.statusRequest!=StatusRequest.loading) {
          if (myservices.sharedPreferences.getString("step") == "2") {
            Get.offAllNamed("HomePage");
          } else if (myservices.sharedPreferences.getString("step") == "1") {
            Get.offAllNamed("Login");
          } else {
            Get.off(ChooseLanguage());
          }
        }
      } else {
        this.timer--;
        update();
      }
    });
  }

  void onInit() {
    controller = Get.put(ButtomBarControllerImp());

    startTimer();
    super.onInit();
  }
}
