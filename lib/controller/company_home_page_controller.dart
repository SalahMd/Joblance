import 'package:get/get.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class CompanyHomePageController extends GetxController {}

class CompanyHomePageControllerImpl extends CompanyHomePageController {
  StatusRequest? statusRequest;

  @override
  void onInit() {
    super.onInit();
    statusRequest = StatusRequest.loading;
    update();
    Future.delayed(Duration(seconds: 3), () {
      statusRequest = StatusRequest.success;
      update();
    });
    String? FCMToken;
    FirebaseMessaging.instance.getToken().then((value) {
      FCMToken = value;
      print("token is" + FCMToken!);
    });
  }
}
