import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/job_applicants_model.dart';
import 'package:joblance/data/remote/job_applicants_back.dart';

abstract class JobApplicantsController extends GetxController {
  getApplicants();
}

class JobApplicantsControllerImpl extends JobApplicantsController {
  Myservices myServices = Get.find();
  StatusRequest? statusRequest;
  final int jobId;
  late String language, token;
  JobApplicantsBack jobApplicantsBack = new JobApplicantsBack(Get.put(Crud()));
  List <JobApplicantsModel> applicants=[];
  JobApplicantsControllerImpl(
      {required this.jobId});
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
}
