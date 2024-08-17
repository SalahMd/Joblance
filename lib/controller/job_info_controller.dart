import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/job_info_model.dart';
import 'package:joblance/data/remote/job_info_back.dart';
import 'package:joblance/view/screens/add_job/add_job.dart';
import 'package:joblance/view/screens/applay_job_page.dart';
import 'package:joblance/view/screens/job_applicants/job_applicants.dart';

abstract class JobInfoController extends GetxController {
  getUserInfo();
  buttonFunction(int id);
  getJobInfo();
  deleteJob();
  updateJob();
  addToImportantJobs();
}

class JobInfoControllerImpl extends JobInfoController {
  Myservices myServices = Get.find();
  StatusRequest? statusRequest, addToImportantJobsStatus;
  final int jobId;
  late int userId;
  JobBack jobInfoBack = new JobBack(Get.put(Crud()));
  late String roleId;
  late String token, language;
  final BuildContext context;

  bool isOwner = false, isVisible = false;
  JobModel jobInfoModel = JobModel();
  JobInfoControllerImpl(this.context, {required this.jobId});
  @override
  void onInit() async {
    await getUserInfo();
    await getJobInfo();
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
    language = myServices.sharedPreferences.getString("lang")!;
  }

  @override
  getJobInfo() async {
    statusRequest = StatusRequest.loading;
    var response = await jobInfoBack.getData(
        token, AppLinks.jobInfo + "/" + jobId.toString() + "?lang=" + language);
    statusRequest = handelingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        jobInfoModel = JobModel.fromJson(response['data']);
      }
    }
    if (userId == jobInfoModel.companyId) {
      isOwner = true;
    }
    if (isOwner || roleId == "2" && jobInfoModel.active == 1) {
      isVisible = true;
    }
    update();
  }

  @override
  updateJob() {
    Get.to(
        AddJob(
          isUpdate: true,
          name: jobInfoModel.companyName!,
          image: jobInfoModel.companyImage!,
        ),
        arguments: {
          "about_job": jobInfoModel.jobDescription,
          "title": jobInfoModel.jobTitle,
          "requirements": jobInfoModel.requirements,
          "additional_information": jobInfoModel.additionalInfo,
          "id": jobInfoModel.id,
          "salary": jobInfoModel.salary,
          "location": jobInfoModel.location,
          "remote_id": jobInfoModel.remoteId,
          "major_id": jobInfoModel.mojorId,
          "experience_level_id": jobInfoModel.experienceLevelId,
          "job_type_id": jobInfoModel.jobTypeId,
          "show_about_the_company": jobInfoModel.aboutCompany,
          "show_number_of_employees": jobInfoModel.numOfEmployees,
          "active": jobInfoModel.active,
        });
  }

  @override
  deleteJob() async {
    Get.back();
    var response = await jobInfoBack.deleteData(jobId.toString(), token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.back();

        snackBar("", "yourjobhasbeendeleted".tr, context);
      } else {
        animationedAlert(AppAnimations.wrong, "couldn'tdelete".tr);
      }
    } else {
      animationedAlert(AppAnimations.wrong, "couldn'tdelete".tr);
    }
  }

  buttonFunction(int id) {
    if (isOwner) {
      Get.to(JobApplicants(
        name: jobInfoModel.jobTitle!,
        date: jobInfoModel.date!,
        id: jobInfoModel.id!,
      ));
    } else {
      Get.to(ApplayJobPage(
        JobId: id,
      ));
    }
  }

  addToImportantJobs() async {
    addToImportantJobsStatus = StatusRequest.loading;
    animationedAlert(AppAnimations.loadings, "pleasewait".tr);
    var response =
        await jobInfoBack.addToImportantJobs(jobId.toString(), token);
    addToImportantJobsStatus = handelingData(response);
    Get.back();
    if (StatusRequest.success == addToImportantJobsStatus) {
      if (response['status'] == "success") {
        Get.back();
        animationedAlert(
            AppAnimations.done, "yourjobhassbeenaddedtoimportantjobs".tr);
      }else{
         animationedAlert(
            AppAnimations.wrong, "couldn'taddtoimportantjobs".tr);
      }
    }else{
      animationedAlert(
            AppAnimations.wrong, "couldn'taddtoimportantjobs".tr);
    }
  }
}
