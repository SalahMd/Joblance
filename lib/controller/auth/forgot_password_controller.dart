import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/data/remote/auth/forgot_password_back.dart';
import 'package:joblance/view/screens/auth/email_verifiction.dart';

abstract class ForgotPasswordController extends GetxController {
  sendCode();
}

class ForgotPasswordControllerImpl extends ForgotPasswordController {
  late TextEditingController email;
  StatusRequest? statusRequest;
  ForgotPasswordBack forgotPasswordBack =
      new ForgotPasswordBack(Get.put(Crud()));
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    super.dispose;
  }

  @override
  void onInit() {
    email = new TextEditingController();
    super.onInit();
  }

  @override
  sendCode() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "sendingcodetoemail".tr);
      update();
      var response = await forgotPasswordBack.sendCode(email.text);
      statusRequest = hadelingData(response);
      Get.back();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAll(EmailVerification(), arguments: {"email": email.text});
        }
      }
    }
  }
}
