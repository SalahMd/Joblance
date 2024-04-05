import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/statusrequest.dart';

abstract class CompanyHomePageController extends GetxController {}

class CompanyHomePageControllerImpl extends CompanyHomePageController {
  StatusRequest? statusRequest;

  @override
  void onInit() {
    super.onInit();
      FirebaseMessaging.instance.getToken().then((value) {
        String? token = value;
        print("token is" + token!);
      });
    

    statusRequest = StatusRequest.loading;
    update();
    Future.delayed(Duration(seconds: 3), () {
      statusRequest = StatusRequest.success;
      update();
    });
  }
}