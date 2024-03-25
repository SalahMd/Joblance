import 'dart:async';
import 'package:get/get.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/view/screens/choose_language.dart';

abstract class SplashScreenController extends GetxController {
  startTimer();
}

class SplashScreenControllerImpl extends SplashScreenController {
  int timer = 3;
  late Timer countdownTimer;
  Myservices myservices = Get.find();

  @override
  void startTimer() {
    timer = 4;
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (this.timer == 0) {
        timer.cancel();
        if (myservices.sharedPreferences.getString("step") == "2") {
          Get.offNamed("HomePage");
        }
        if (myservices.sharedPreferences.getString("step") == "1") {
          Get.offNamed("Login");
        } else {
          Get.off(ChooseLanguage());
        }
      } else {
        this.timer--;
        update();
      }
    });
  }

  void onInit() {
    startTimer();
    super.onInit();
  }
}
