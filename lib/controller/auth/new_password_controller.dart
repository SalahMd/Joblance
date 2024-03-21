import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/statusrequest.dart';

abstract class NewPasswordController extends GetxController {}

class NewPasswordControllerImpl extends NewPasswordController {
  late TextEditingController password;
  late TextEditingController confirmPassword;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  StatusRequest? statusRequest;
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    password = new TextEditingController();
    confirmPassword = new TextEditingController();
    //email = Get.arguments['email'];
    super.onInit();
  }
}
