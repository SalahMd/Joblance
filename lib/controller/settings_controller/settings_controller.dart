import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/auth/logout_back.dart';

abstract class SettingsController extends GetxController {
  logOut();
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
    mode = myServices.sharedPreferences.getString("mode")!;
    var response = await logout.postData(token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        String id = myServices.sharedPreferences.getInt("id").toString();
        FirebaseMessaging.instance.unsubscribeFromTopic("users");
        FirebaseMessaging.instance.unsubscribeFromTopic("user" + id);
        myServices.sharedPreferences.clear();
        myServices.sharedPreferences.setString("lang", lang);
        myServices.sharedPreferences.setString("mode", mode);
        Get.offNamed("Login");
      } else {
        print("error");
      }
    }
    print("logout");
  }
}
