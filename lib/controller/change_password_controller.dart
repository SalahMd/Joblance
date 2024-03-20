import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ChangePasswordController extends GetxController {}

class ChangePasswordControllerImpl extends ChangePasswordController {
  late TextEditingController oldPassword;
  late TextEditingController newPassword;
  late TextEditingController confirmNewPassword;
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
}
