import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/job_info_back.dart';
import 'package:joblance/view/screens/applay_job_page.dart';
import 'package:joblance/view/screens/job_applicants/job_applicants.dart';

abstract class JobInfoController extends GetxController {
  getUserInfo();
  buttonFunction();
  getJobInfo();
}

class JobInfoControllerImpl extends JobInfoController {
  Myservices myServices = Get.find();
  StatusRequest? statusRequest;
  final int jobId;
  late int userId;
  JobBack jobInfoBack = new JobBack(Get.put(Crud()));
  late String roleId;
  late String token;
  bool isOwner = false, isVisible = false;
  Map data = {};

  JobInfoControllerImpl({required this.jobId});
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
    userId = myServices.sharedPreferences.getInt("id")!;
    token = myServices.sharedPreferences.getString('token')!;
  }

  @override
  getJobInfo() async {
    statusRequest = StatusRequest.loading;
    var response = await jobInfoBack.getData(token, jobId.toString());
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      }
    }
    if (userId == data['user_id']) {
      isOwner = true;
    }
    if (isOwner || roleId == "2") {
      isVisible = true;
    }
    update();
  }

  buttonFunction() {
    if (isOwner) {
      Get.to(JobApplicants());
    } else {
      Get.to(ApplayJobPage());
    }
  }
}
