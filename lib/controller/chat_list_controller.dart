import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/laravel_echo/laravel_echo.dart';
import 'package:joblance/core/services/services.dart';

abstract class ChatListController extends GetxController {}

class ChatListControllerImpl extends ChatListController {
  StatusRequest? statusRequest;
  late String token;
  Myservices myServices = Get.find();
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    LaravelEcho.init(token: token);
    super.onInit();
  }

  void dispose() {
    LaravelEcho.instance.disconnect();
    super.dispose();
  }
}
