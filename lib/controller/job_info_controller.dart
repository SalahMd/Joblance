import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/job_info_model.dart';
import 'package:joblance/data/remote/job_info_back.dart';
import 'package:joblance/view/screens/add_job/add_job.dart';
import 'package:joblance/view/screens/applay_job_page.dart';
import 'package:joblance/view/screens/job_applicants/job_applicants.dart';

abstract class JobInfoController extends GetxController {
  getUserInfo();
  buttonFunction();
  getJobInfo();
  updateJob();
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
  late JobInfoModel jobInfoModel;
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

  @override
  updateJob() {
    Get.to(
        AddJob(
          isUpdate: true,
        ),
        arguments: {
          "about_job": jobInfoModel.aboutJob,
          "job_title": jobInfoModel.jobTitle,
          "requirements": jobInfoModel.reqirments,
          "additional_information": jobInfoModel.additionalInfo,
          "id": jobInfoModel.id,
          "job_location": jobInfoModel.jobLocation,
          "company_name": jobInfoModel.companyName,
          "remote": jobInfoModel.remote,
          "major": jobInfoModel.major,
          "experience": jobInfoModel.JobExperience,
          "about_company": jobInfoModel.aboutCompany
        });
  }

  buttonFunction() {
    if (isOwner) {
      Get.to(JobApplicants());
    } else {
      Get.to(ApplayJobPage());
    }
  }
}
