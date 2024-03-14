import 'package:get/get.dart';
import 'package:joblance/core/class/statusrequest.dart';

abstract class FreelancerHomePageController extends GetxController {}

class FreelancerHomePageControllerImpl extends FreelancerHomePageController {
  StatusRequest? statusRequest;

  @override
  void onInit() {
    super.onInit();
    statusRequest = StatusRequest.loading;
    update();
    Future.delayed(Duration(seconds: 2), () {
      statusRequest = StatusRequest.success;
      update();
    });
  }
}
