import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/task_back.dart';
abstract class TaskOffersController extends GetxController {
  getOffers();
}

class TaskOffersControllerImpl extends TaskOffersController {
  StatusRequest? statusRequest;
  late String token, lang;
   final String id;
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  Myservices myServices = Get.find();
  List data = [];

  TaskOffersControllerImpl({required this.id});
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    lang = myServices.sharedPreferences.getString("lang")!;
    getOffers();
    super.onInit();
  }

  @override
  getOffers() async {
    statusRequest = StatusRequest.loading;
    var response = await taskBack.getOffers(token, id,lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      }
    }
    update();
  }
}
