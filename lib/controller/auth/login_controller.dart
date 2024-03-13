import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/services/services.dart';

abstract class LogiInController extends GetxController {
  logIn();
  goToHomePage();
  goToSignup();
  showPassword();
}

class LogInControllerImpl extends LogiInController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  //LoginData loginData = LoginData(Get.put(Crud())); //(Get.find)
  StatusRequest? statusRequest;
  Myservices myServices = Get.find();
  bool isshown = true;
  double containerWidth = 300.w;
  hideButton() {
    containerWidth = 0;
    update();
    Future.delayed(const Duration(seconds: 2), () {
      logIn();
    });

    update();
  }

  @override
  goToHomePage() {
    update();
    Get.offAllNamed("HomePage");
  }

  @override
  showPassword() {
    isshown = !isshown;
    update();
  }

  @override
  logIn() async {
    Get.offAllNamed("HomePage");
  }

  @override
  goToSignup() {
    Get.offNamed("SignUp");
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }
}
