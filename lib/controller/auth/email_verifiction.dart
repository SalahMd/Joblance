import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  showPassword();
  startTimer();
  reSendCode();
  resetPassword();
}

class EmailVerifictionControllerImpl extends EmailVerifictionController {
  final BuildContext context;
  String? email;
  String? verifyFor;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String? codeController;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  bool isShown = true;
  ForgotPasswordBack forgotPasswordBack =
      new ForgotPasswordBack(Get.put(Crud()));
  StatusRequest? statusRequest;
  int timer = 60;
  late Timer countdownTimer;

  EmailVerifictionControllerImpl({required this.context});
  @override
  checkCode() async {
    statusRequest = StatusRequest.loading;
    animationedAlert(AppAnimations.loadings, "checkingcode".tr);
    update();
    var response =
        await forgotPasswordBack.checkCode(email!, codeController!, verifyFor!);
    statusRequest = handelingData(response);
    Get.back();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (verifyFor == "forgot_password")
          Get.offAll(NewPassword(), arguments: {"email": email});
        else {
          Get.offAllNamed("Login");
          snackBar("", "youremailhasbeenverified".tr, context);
        }
      } else {
        animationedAlert(AppAnimations.wrong, "wrongcode".tr);
        update();
      }
    } else {
      animationedAlert(AppAnimations.wrong, "wrongcode".tr);
      update();
    }
  }

  @override
  showPassword() {
    isShown = !isShown;
    update();
  }

  @override
  resetPassword() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      if (!isPasswordMatch()) {
        animationedAlert(AppAnimations.wrong, "passworddoesntmatch".tr);
        update();
        return;
      }
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await forgotPasswordBack.resetPassword(password.text, email!);
      statusRequest = handelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAll(Login());
          snackBar("", "yourpasswordhasbeenchanged".tr, context);
        }
      }
    }
  }

  // @override
  // goToSuccessSignUp(String verificationCode) async {}

  @override
  void onInit() {
    password = TextEditingController();
    confirmPassword = TextEditingController();
    Map<String, dynamic>? arguments = Get.arguments as Map<String, dynamic>?;
    email = arguments?['email'] as String?;
    verifyFor = arguments?['checkfor'] as String?;
    if (verifyFor == "emailverify") {
      reSendCode();
    }

    startTimer();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  bool isPasswordMatch() {
    return password.text == confirmPassword.text;
  }

  @override
  void startTimer() {
    timer = 60;
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (this.timer == 0) {
        timer.cancel();
      } else {
        this.timer--;
        update();
      }
    });
  }

  @override
  reSendCode() async {
    statusRequest = StatusRequest.loading;
    //because it throw error if the resend is for email verification
    if (verifyFor != "emailverify")
      animationedAlert(AppAnimations.loadings, "sendingcodetoemail".tr);
    update();
    var response = await forgotPasswordBack.resendCode(email!, verifyFor!);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.back();
      }
    }
  }

  @override
  goToSuccessSignUp(String verificationCode) {}
}
