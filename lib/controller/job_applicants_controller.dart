import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/job_applicants_model.dart';
import 'package:joblance/data/remote/job_applicants_back.dart';

abstract class JobApplicantsController extends GetxController {
  acceptUser(int userid);
  getApplicants();
}

class JobApplicantsControllerImpl extends JobApplicantsController {
  Myservices myServices = Get.find();
  StatusRequest? statusRequest, acceptUserStatus;
  final int jobId;
  late String language, token;
  JobApplicantsBack jobApplicantsBack = new JobApplicantsBack(Get.put(Crud()));
  List<JobApplicantsModel> applicants = [];
  JobApplicantsControllerImpl({required this.jobId});
  @override
  onInit() async {
    language = myServices.sharedPreferences.getString("lang")!;
    token = myServices.sharedPreferences.getString("token")!;
    await getApplicants();
    super.onInit();
  }

  @override
  getApplicants() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await jobApplicantsBack.getApplicants(
        token, jobId.toString(), language);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var data in response['data']) {
          applicants.add(JobApplicantsModel.fromJson(data));
        }
      }
    }
    update();
  }

  acceptUser(int userId) async {
    acceptUserStatus = StatusRequest.loading;
    animationedAlert(AppAnimations.loadings, "pleasewait".tr);
    var response = await jobApplicantsBack.acceptUser(
        token, {"user_id": userId.toString(), "job_detail_id": jobId});
    acceptUserStatus = handelingData(response);
    Get.back();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.back();
        animationedAlert(
            AppAnimations.done, "theuserisacceptedandrecivedanemail".tr);
      }else{
        animationedAlert(
            AppAnimations.wrong, "thisuserisaccepted".tr);
      }
    }else{
        animationedAlert(
            AppAnimations.wrong, "could'tacceptuser".tr);
      }
  }
}
