import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'package:joblance/view/screens/auth/forgot_password/forgot_password.dart';

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
  late TextEditingController phoneController;
  LoginBack loginBata = LoginBack(Get.put(Crud()));
  StatusRequest? statusRequest;
  Myservices myServices = Get.find();
  bool isshown = true;
  double containerWidth = 300.w;

  // hideButton() {
  //   containerWidth = 0;
  //   update();
  //   Future.delayed(const Duration(seconds: 2), () {
  //     logIn();
  //   });

  //   update();
  // }

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
      var response = await loginBata.login({
        "email": emailController.text,
        "password": passwordController.text,
        "fcm_token": getFCMToken()
      });
      statusRequest = hadelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences.setInt("id", response['data']["id"]);
          myServices.sharedPreferences
              .setString("token", response['data']["accessToken"]);
          myServices.sharedPreferences
              .setString("role_id", response['data']["type"]);
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed("HomePage");
        } else if (response['status'] == "failure" &&
            response['error_message']['error'] == "email is not verified") {
          await animationedAlertWithActions(AppAnimations.info,
              "youremailisnotverified".tr, goToEmailVerification);
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

  goToForgotPassword() {
    Get.to(ForgotPassword());
  }

  goToEmailVerification() {
    Get.back();
    Get.offNamed("EmailVerification",
        arguments: {"email": emailController.text, "checkfor": "emailverify"});
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

  String getFCMToken() {
    String? FCMToken;
    FirebaseMessaging.instance.getToken().then((value) {
      FCMToken = value;
      print("token is" + FCMToken!);
    });
    if (FCMToken != null)
      return FCMToken!;
    else
      return "";
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
      String? googleToken = googleAuth.accessToken;
      print("token is" + googleToken!);
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginBata.googleLogin({
        "access_token":googleToken,
        "fcm_token":getFCMToken()
      });
      statusRequest = hadelingData(response);
      print(statusRequest);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //check if the user have an account or not
          if (response['data']['authorized'] == 1) {
            myServices.sharedPreferences.setInt("id", response['data']["id"]);
            myServices.sharedPreferences
                .setString("token", response['data']["accessToken"]);
            myServices.sharedPreferences
                .setString("role_id", response['data']["type"].toString());
            myServices.sharedPreferences.setString("step", "2");
            Get.offNamed("HomePage");
          } else {
            Get.offAllNamed("SignUp", arguments: {
              "email": response['data']['email'],
              "image": response['data']['image'],
              "name": response['data']['name'],
              "first_name": response['data']['given_name'],
              "last_name": response['data']['family_name']
            });
          }
        } else {
          animationedAlert(AppAnimations.wrong, "errorloggingin".tr);
          update();
        }
      }
    }
  }
}
