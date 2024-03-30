import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/change_password_back.dart';

abstract class ChangePasswordController extends GetxController {
  changePassword();
}

class ChangePasswordControllerImpl extends ChangePasswordController {
  late TextEditingController oldPassword;
  late TextEditingController newPassword;
  late TextEditingController confirmNewPassword;
  Myservices myServices = Get.find();
  ChangePasswordBack changePasswordBack =
      new ChangePasswordBack(Get.put(Crud()));
  StatusRequest? statusRequest;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void onInit() {
    oldPassword = TextEditingController();
    newPassword = TextEditingController();
    confirmNewPassword = TextEditingController();
    super.onInit();
  }

  void dispose() {
    oldPassword.dispose();
    newPassword.dispose();
    confirmNewPassword.dispose();
    super.dispose();
  }

  @override
  changePassword() async {
    var token = myServices.sharedPreferences.getString("token");
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "checkingdata".tr);
      update();
      var response = await changePasswordBack.changePassword(
          oldPassword.text, newPassword.text, token);
      statusRequest = hadelingData(response);
      Get.back();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();
          animationedAlert(AppAnimations.done, "passwordchangedsucessfully".tr);
          update();
        } else {
          animationedAlert(AppAnimations.wrong, "wrongoldpassword".tr);
          update();
        }
      }
    }
  }
}
