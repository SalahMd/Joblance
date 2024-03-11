import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/services/services.dart';

abstract class DarkMode extends GetxController {
  changeMode(String theme);
}
class DarkModeImpl extends DarkMode {
  Myservices myServices = Get.find();
  late ThemeMode themeMode;
  @override
  changeMode(String theme) {
    ThemeMode mode;
    if (theme == "dark") {
      mode = ThemeMode.dark;
    } else {
      mode = ThemeMode.light;
    }
    myServices.sharedPreferences.setString("mode", theme);
    Get.changeThemeMode(mode);
    update();
  }

  @override
  void onInit() {
    String? sharedpreflang = myServices.sharedPreferences.getString("mode");
    if (sharedpreflang == "dark") {
      themeMode = ThemeMode.dark;
    } else if (sharedpreflang == "light") {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.light;
    }
    super.onInit();
  }
}
