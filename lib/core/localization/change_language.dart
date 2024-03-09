import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:joblance/core/services/services.dart';

class ChangeLanguage extends GetxController {
  Locale? language;
  Myservices myservices = Get.put(Myservices());
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myservices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  void onInit() {
    String? sharedpreflang = myservices.sharedPreferences.getString("lang");
    if (sharedpreflang == "ar") {
      language = const Locale("ar");
    } else if (sharedpreflang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }

  changeColor() {
    update();
  }
}
