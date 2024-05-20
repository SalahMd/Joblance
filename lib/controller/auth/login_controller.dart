import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/links.dart';
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
  late TextEditingController ip = new TextEditingController();
  late TextEditingController phoneController;
  LoginBack loginBata = LoginBack(Get.put(Crud()));
  StatusRequest? statusRequest;
  Myservices myServices = Get.find();
  bool isshown = true;
  double containerWidth = 300.w;
  String deviceToken = "";

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

  saveUserData(Map data) {
    myServices.sharedPreferences.setInt("id", data["id"]);
    myServices.sharedPreferences.setString("token", data["accessToken"]);
    myServices.sharedPreferences.setString("role_id", data["type"]);
    myServices.sharedPreferences.setString("step", "2");
    myServices.sharedPreferences.setString("ip", ip.text);
  }

  @override
  logIn() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      AppLinks.IP = ip.text;
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "pleasewait".tr);
      var response = await loginBata.login({
        "email": emailController.text,
        "password": passwordController.text,
        "device_token": deviceToken
      });
      statusRequest = handelingData(response);
      Get.back();

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          saveUserData(response['data']);
          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance
              .subscribeToTopic("user" + response['data']['id'].toString());
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

  getFCMToken() async {
    String? FCMToken;
    FirebaseMessaging.instance.getToken().then((value) {
      FCMToken = value;
      print("token is" + FCMToken!);
      deviceToken = FCMToken!;
    });
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    getFCMToken();
    super.onInit();
  }

  @override
  googleSignin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      String? googleToken = googleAuth.accessToken;
      print(googleToken);
      statusRequest = StatusRequest.loading;
      var response = await loginBata.googleLogin(
          {"access_token": googleToken, "device_token": deviceToken});
      statusRequest = handelingData(response);
      print(statusRequest);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //check if the user have an account or not
          if (response['data']['authorized'] == 1) {
            saveUserData(response['data']);
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
