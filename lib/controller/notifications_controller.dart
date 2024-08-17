import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/notifications_back.dart';

abstract class NotificationsController extends GetxController {
  getNotifications();
}

class NotificationsControllerImpl extends NotificationsController {
  StatusRequest? statusRequest;
  late String language, token;
  Myservices myservices = Get.find();
  NotificationsBack notificationsBack = new NotificationsBack(Get.put(Crud()));

  @override
  void onInit() async {
    token = myservices.sharedPreferences.getString("token")!;
    language = myservices.sharedPreferences.getString("lang")!;
    super.onInit();
    await getNotifications();
  }

  @override
  getNotifications()async {
    statusRequest = StatusRequest.loading;
    var response =
        await notificationsBack.getData(token,);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        
      }
    }
    update();
  }

  
}
