import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/freelancer/freelancer_home_page_back.dart';

abstract class FreelancerHomePageController extends GetxController {
  getFreelancerInfo();
  getJobs();
}

class FreelancerHomePageControllerImpl extends FreelancerHomePageController {
  StatusRequest? statusRequest;
  FreeLnacerHomePageBack freeLnacerHomePageBack =
      new FreeLnacerHomePageBack(Get.put(Crud()));
  String? token, id;
  String language = 'en';
  Myservices myservices = Get.find();
  late String name, image="";
  @override
  void onInit() {
    token = myservices.sharedPreferences.getString("token")!;
    id = myservices.sharedPreferences.getInt("id").toString();
   // language = myservices.sharedPreferences.getString("lang");
    super.onInit();
    getFreelancerInfo();
  }

  getFreelancerInfo() async {
    statusRequest = StatusRequest.loading;
    var response =
        await freeLnacerHomePageBack.getFreelancerInfo(token, language, id!);
    statusRequest = handelingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        name = response['data']['first_name'];
        image = response['data']['image'];
      }
    }
    update();
  }

  @override
  getJobs() {
    throw UnimplementedError();
  }
}
