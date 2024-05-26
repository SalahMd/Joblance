import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/auth/logout_back.dart';

abstract class SettingsController extends GetxController {
  logOut();
  deleteAccount();
}

class SettingsControllerImpl extends SettingsController {
  StatusRequest? statusRequest;
  Myservices myServices = Get.find();
  late String role;

  LogOutBack logout = new LogOutBack(Get.put(Crud()));
  void onInit() {
    role = myServices.sharedPreferences.getString("role_id")!;
    super.onInit();
  }

  @override
  logOut() async {
    statusRequest = StatusRequest.loading;
    var token = myServices.sharedPreferences.getString("token");
    String lang = "en", mode;
    mode = await myServices.sharedPreferences.getString("mode")!;
    lang = await myServices.sharedPreferences.getString("lang")!;
    var response = await logout.postData(token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        String id = myServices.sharedPreferences.getInt("id").toString();
        FirebaseMessaging.instance.unsubscribeFromTopic("users");
        FirebaseMessaging.instance.unsubscribeFromTopic("user" + id);
        await myServices.sharedPreferences.clear();
        await myServices.sharedPreferences.setString("lang", lang);
        myServices.sharedPreferences.setString("mode", mode);
        Get.offNamed("Login");
      } else {
        print("error");
      }
    }
    print("logout");
  }

  deleteAccount() async {
    statusRequest = StatusRequest.loading;
    String link;
    if (myServices.sharedPreferences.getString("role_id") == "2") {
      link = AppLinks.company;
    }else{
      link = AppLinks.freelancers;
    }
    String token = myServices.sharedPreferences.getString("token")!;
    String lang = "en", mode;
    String id = myServices.sharedPreferences.getInt("id").toString();
    mode = await myServices.sharedPreferences.getString("mode")!;
    lang = await myServices.sharedPreferences.getString("lang")!;
    var response = await logout.deleteAccount(link,token, id);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        FirebaseMessaging.instance.unsubscribeFromTopic("users");
        FirebaseMessaging.instance.unsubscribeFromTopic("user" + id);
        await myServices.sharedPreferences.clear();
        await myServices.sharedPreferences.setString("lang", lang);
        myServices.sharedPreferences.setString("mode", mode);
        Get.offNamed("Login");
      }
    }
  }
}
