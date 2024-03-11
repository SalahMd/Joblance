import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/statusrequest.dart';

abstract class SignUpController extends GetxController {
  goToLogiIn();
  goToSuccessfulSignUp();
  showPassword();
}

class SignUpControllerImpl extends SignUpController {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController phoneController;
  late TextEditingController major;
  late TextEditingController location;
  late TextEditingController studyCase;
  late TextEditingController numOfEmployees;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  bool openToWork = false;
  var image;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusRequest;
  bool isshown = true;

  @override
  showPassword() {
    isshown = !isshown;
    update();
  }

  @override
  goToLogiIn() {
    Get.offNamed("Login");
  }

  @override
  goToSuccessfulSignUp() async {
    Get.offAllNamed("Login");
  }

  @override
  void onInit() {
    phoneController = TextEditingController();
    lastName = TextEditingController();
    firstName = TextEditingController();
    email = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phoneController.dispose();
    lastName.dispose();
    firstName.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    email.dispose();
    super.dispose();
  }
}
