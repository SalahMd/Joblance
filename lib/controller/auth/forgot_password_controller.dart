import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/statusrequest.dart';

abstract class ForgotPasswordController extends GetxController {
  checkCode();
  //goToSuccessSignUp(String verificationCode);
}

class ForgotPasswordControllerImpl extends ForgotPasswordController {
  late TextEditingController email;
  StatusRequest? statusRequest;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  checkCode() {}
  
  @override
  void dispose() {
    email.dispose();
    super.dispose;
  }

  @override
  void onInit() {
    email = new TextEditingController();
    //email = Get.arguments['email'];
    super.onInit();
  }
}
