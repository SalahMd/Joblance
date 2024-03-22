import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/auth/logout_back.dart';

abstract class SettingsController extends GetxController{}
class SettingsControllerImpl extends SettingsController{
    StatusRequest? statusRequest;
  Myservices myServices = Get.find();
  LogOutBack logout =  new LogOutBack(Get.put(Crud()));
  @override
  logOut() async {
    statusRequest = StatusRequest.loading;
    var token = myServices.sharedPreferences.getString("token");
    var response = await logout.postData(token);
    statusRequest = hadelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        myServices.sharedPreferences.clear();
        Get.offNamed("ChooseLanguage");
      } else {
        print("error");
      }
    } else {print("error");}
  }
}

