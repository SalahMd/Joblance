import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/auth/login_back.dart';

abstract class LogiInController extends GetxController {
  logIn();
  goToHomePage();
  goToSignup();
  googleSignin();
  showPassword();
}

class LogInControllerImpl extends LogiInController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  LoginBack loginBata = LoginBack(Get.put(Crud()));
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
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await loginBata.login(emailController.text, passwordController.text);
      statusRequest = hadelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setInt("id", response['data']["user"]["user_id"]);
          myServices.sharedPreferences
              .setString("token", response['data']["accessToken"]);
          myServices.sharedPreferences
              .setString("role_id", response['data']["user"]["role_id"].toString());
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed("HomePage");
        } else {
          animationedAlert(AppAnimations.wrong, "wronglogin".tr);
          update();
        }
      } else {
        animationedAlert(AppAnimations.wrong, "errorloggingin".tr);
        update();
      }
    }
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

  @override
  googleSignin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      String? googleToken = googleAuth.idToken;
      print(googleToken);
    }
  }

}
