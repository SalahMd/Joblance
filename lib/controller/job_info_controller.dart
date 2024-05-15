import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/job_info_back.dart';

abstract class JobInfoController extends GetxController {
  getUserInfo();
  getJobInfo();
}

class JobInfoControllerImpl extends JobInfoController {
  Myservices myServices = Get.find();
  StatusRequest? statusRequest;
  final int id;
  JobBack jobInfoBack = new JobBack(Get.put(Crud()));
  late String roleId;
  late String token;

  JobInfoControllerImpl({required this.id});
  @override
  void onInit() {
    getUserInfo();
    getJobInfo();
    super.onInit();
  }

  void dispose() {
    super.dispose();
  }

  @override
  getUserInfo() {
    roleId = myServices.sharedPreferences.getString("role_id")!;
    token = myServices.sharedPreferences.getString('token')!;
  }

  @override
  getJobInfo() async {
    statusRequest = StatusRequest.loading;
    var response = await jobInfoBack.getData(token, id.toString());
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {}
    }
  }
}
