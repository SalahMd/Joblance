import 'dart:async';
import 'package:get/get.dart';
import 'package:joblance/controller/buttom_bar_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/view/screens/choose_language.dart';
import 'package:joblance/view/screens/choose_plan.dart';

abstract class SplashScreenController extends GetxController {
  startTimer();
}

class SplashScreenControllerImpl extends SplashScreenController {
  int timer = 2;
  late Timer countdownTimer;
  ButtomBarControllerImp? controller;
  Myservices myservices = Get.find();

  @override
  void startTimer() {
    timer = 2;
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (this.timer == 0) {
        timer.cancel();
        if (controller != null) {
          if (controller!.statusRequest != StatusRequest.loading) {
            if (myservices.sharedPreferences.getString("step") == "2") {
              Get.offAllNamed("HomePage");
              if(!controller!.subscribed){
                subscriptionAlert(() {
            Get.to(ChoosePlan());
          });
              }
            } else if (myservices.sharedPreferences.getString("step") == "1") {
              Get.offAllNamed("Login");
            } else {
              Get.off(ChooseLanguage());
            }
          }
        } else {
          if (myservices.sharedPreferences.getString("step") == "1") {
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
    if (myservices.sharedPreferences.getString("step") == "2")
      controller = Get.put(ButtomBarControllerImp());
    startTimer();
    super.onInit();
  }
}
