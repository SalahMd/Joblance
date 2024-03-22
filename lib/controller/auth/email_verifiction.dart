import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/data/remote/auth/forgot_password_back.dart';
import 'package:joblance/view/screens/auth/forgot_password/new_password.dart';
import 'package:joblance/view/screens/auth/login.dart';

abstract class EmailVerifictionController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verificationCode);
  isPasswordMatch();
}

class EmailVerifictionControllerImpl extends EmailVerifictionController {
  String? email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String? codeController;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  bool isShown = true;
  ForgotPasswordBack forgotPasswordBack =
      new ForgotPasswordBack(Get.put(Crud()));
  StatusRequest? statusRequest;

  @override
  checkCode() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await forgotPasswordBack.checkCode(email!, codeController!);
    statusRequest = hadelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAll(NewPassword(), arguments: {"email": email});
      }
    }
  }

  @override
  showPassword() {
    isShown = !isShown;
    update();
  }

  resetPassword() async {
    var formdata = formState.currentState;
    if (formdata!.validate() && isPasswordMatch()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await forgotPasswordBack.resetPassword(password.text, email!);
      statusRequest = hadelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAll(Login());
        }
      }
    }
  }

  @override
  goToSuccessSignUp(String verificationCode) async {}

  @override
  void onInit() {
    password = TextEditingController();
    confirmPassword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  bool isPasswordMatch() {
    return password.text == confirmPassword.text;
  }

  reSendCode() async {
    var formdata = formState.currentState;
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "sendingcodetoemail".tr);
      update();
      var response = await forgotPasswordBack.sendCode(email!);
      statusRequest = hadelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();
        }
      }
    
  }
}
