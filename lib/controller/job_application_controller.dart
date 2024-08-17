import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/job_applicants_model.dart';
import 'package:joblance/data/remote/company/company_home_page_back.dart';
import 'package:joblance/data/remote/job_applicants_back.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class JobApplicationController extends GetxController {
  StatusRequest? statusRequest, acceptUser, downloadFileStatus;
  final String id;
  Myservices myServices = Get.find();
  JobApplicantsBack jobApplicantsBack = JobApplicantsBack(Get.put(Crud()));
  CompanyHomePageBack companyHomePageBack =
      new CompanyHomePageBack(Get.put(Crud()));
  late String token, lang;
  List freelancers = [];
  JobApplicantsModel application = JobApplicantsModel();

  JobApplicationController({required this.id});
  @override
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    lang = myServices.sharedPreferences.getString("lang")!;

    getData();

    super.onInit();
  }

  accept() async {
    acceptUser = StatusRequest.loading;
    animationedAlert(AppAnimations.loadings, "pleasewait".tr);
    var response = await jobApplicantsBack.acceptUser(token, {
      "user_id": application.freelancerId.toString(),
      "job_detail_id": application.jobDetailId.toString()
    });
    acceptUser = handelingData(response);
    Get.back();
    if (StatusRequest.success == acceptUser) {
      if (response['status'] == "success") {
        Get.back();
      } else {
        animationedAlert(
            AppAnimations.wrong, "This user already accepted in this job".tr);
      }
    } else {
      animationedAlert(AppAnimations.wrong, "could'taccept".tr);
    }
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await jobApplicantsBack.getData(token, id.toString(), lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        application = JobApplicantsModel.fromJson(response['data']);
      }
    }
    update();
  }

  downloadFile(BuildContext context) {
    downloadFileStatus = StatusRequest.loading;
    update();
    FileDownloader.downloadFile(
        url: AppLinks.IP + application.cV!,
        name: "file",
        onDownloadCompleted: (String path) {
          downloadFileStatus = StatusRequest.success;
          print('FILE DOWNLOADED TO PATH: $path');
          snackBar("", "downloadedsuccessfully".tr, context);
          update();
        },
        onDownloadError: (String error) {
          downloadFileStatus = StatusRequest.failure;
          print('DOWNLOAD ERROR: $error');
          snackBar("", "could'tdownload".tr, context);
          update();
        });
  }
}
