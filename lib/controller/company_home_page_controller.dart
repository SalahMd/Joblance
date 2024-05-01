import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/company_home_page_back.dart';

abstract class CompanyHomePageController extends GetxController {}

class CompanyHomePageControllerImpl extends CompanyHomePageController {
  StatusRequest? statusRequest;
  Myservices myServices = Get.find();
  late String token;
  late String language;
  List freelancers = [];
  CompanyHomePageBack companyHomePageBack =
      new CompanyHomePageBack(Get.put(Crud()));

  @override
  void onInit() {
    getFreelancers();
    super.onInit();
  }

  getFreelancers() async {
    statusRequest = StatusRequest.loading;
    update();
    token = myServices.sharedPreferences.getString("token")!;
    language = myServices.sharedPreferences.getString("lang")==null?"en":myServices.sharedPreferences.getString("lang")!;
    var response = await companyHomePageBack.getFreeLancers(token, language);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        freelancers.addAll(response['data']);
        print(freelancers);
      }
    }
    update();
  }
}
