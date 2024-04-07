import 'package:firebase_core/firebase_core.dart';
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
  LogOutBack logout = new LogOutBack(Get.put(Crud()));
  @override
  logOut() async {
    statusRequest = StatusRequest.loading;
    var token = myServices.sharedPreferences.getString("token");
    var response = await logout.postData(token);
    statusRequest = hadelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
       String id = myServices.sharedPreferences.getInt("id").toString();
        FirebaseMessaging.instance.unsubscribeFromTopic("users");
        FirebaseMessaging.instance.unsubscribeFromTopic("user"+id);
        myServices.sharedPreferences.clear();
        Get.offNamed("ChooseLanguage");
      } else {
        print("error");
      }
    }
  }
}
