import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/company/company_home_page_back.dart';
import 'package:joblance/data/remote/job_info_back.dart';

abstract class AddjobController extends GetxController {
  addJob(bool isUpdate);
  getJobData();
  getMajors();
  changeCheckBoxValue(String box);
  updateDropDownValue(String? newValue, String changingElement);
}

class AddjobControllerImpl extends AddjobController {
  late TextEditingController aboutJob;
  late TextEditingController additionalInfo;
  late TextEditingController requirements;
  late TextEditingController salary;
  late TextEditingController jobTitle;
  late TextEditingController jobLocation;
  late String token, language;
  StatusRequest? statusRequest;
  Myservices myservices = Get.find();
int? id;
  JobBack jobBack = new JobBack(Get.put(Crud()));
  bool showNumOfEmployees = false, importantJobs = false;
  bool showAboutCompany = false;
  String majorValue = '1',
      remoteValue = '1',
      jobTypeValue = '1',
      jobExpirenceValue = '1';

  List<DropdownMenuItem<String>> jobType = [
    DropdownMenuItem<String>(
      value: '1',
      child: Text("parttime".tr),
    ),
    DropdownMenuItem<String>(
      value: '2',
      child: Text("fulltime".tr),
    ),
    DropdownMenuItem<String>(
      value: '3',
      child: Text("temporary".tr),
    ),
  ];
  List<DropdownMenuItem<String>> remote = [
    DropdownMenuItem<String>(
      value: '1',
      child: Text("remote".tr),
    ),
    DropdownMenuItem<String>(
      value: '2',
      child: Text("hybrid".tr),
    ),
    DropdownMenuItem<String>(
      value: '3',
      child: Text("onsite".tr),
    ),
  ];
  List<DropdownMenuItem<String>> jobExperience = [
    DropdownMenuItem<String>(
      value: '1',
      child: Text("internship".tr),
    ),
    DropdownMenuItem<String>(
      value: '2',
      child: Text("junior".tr),
    ),
    DropdownMenuItem<String>(
      value: '3',
      child: Text("senior".tr),
    ),
    DropdownMenuItem<String>(
      value: '4',
      child: Text("director".tr),
    ),
  ];
  CompanyHomePageBack companyHomePageBack =
      new CompanyHomePageBack(Get.put(Crud()));
  List<DropdownMenuItem<String>> majors = [];

  @override
  onInit() async {
    aboutJob = new TextEditingController();
    additionalInfo = new TextEditingController();
    requirements = new TextEditingController();
    salary = new TextEditingController();
    jobLocation = new TextEditingController();
    jobTitle = new TextEditingController();
    language = myservices.sharedPreferences.getString("lang")!;
    token = myservices.sharedPreferences.getString("token")!;
    await getMajors();
    super.onInit();
  }

  getMajors() async {
    statusRequest = StatusRequest.loading;
    var response = await companyHomePageBack.getMajor(token, language);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (int i = 0; i < response['data'].length; i++) {
          majors.add(DropdownMenuItem(
            value: response['data'][i]['id'].toString(),
            child: Text(response['data'][i]['name']),
          ));
        }
        print(majors);
      }
    }
    update();
  }

  @override
  dispose() {
    aboutJob.dispose();
    additionalInfo.dispose();
    requirements.dispose();
    salary.dispose();
    jobTitle.dispose();
    jobLocation.dispose();
    super.dispose();
  }

  @override
  addJob(bool isUpdate) async {
    statusRequest = StatusRequest.loading;
    animationedAlert(AppAnimations.loadings, "pleasewait".tr);
    var response;
    Map data = {
      "job_title": jobTitle.text,
      "job_description": aboutJob.text,
      "salary": salary.text,
      "location": jobLocation.text,
      "job_type_id": jobTypeValue,
      "job_mojor": majorValue,
      "remote_id": remoteValue,
      "requirements": requirements.text,
      "additional_info": additionalInfo.text,
      "experience_level_id": jobExpirenceValue,
      "about_company": showAboutCompany ? "1" : "0",
      "num_of_employees": showNumOfEmployees ? "1" : "0",
    };
    if (!isUpdate)
      response = await jobBack.postData(token, data);
    else
      response = await jobBack.updateData(token,id.toString(), data);
    statusRequest = handelingData(response);
    Get.back();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.back();
        animationedAlert(AppAnimations.done, "yourjobhasbeenposted");
      }
    }
  }

  @override
  getJobData() {
    throw UnimplementedError();
  }

  changeCheckBoxValue(String box) {
    if (box == "aboutcompany")
      showAboutCompany = !showAboutCompany;
    else if (box == "showemployees")
      showNumOfEmployees = !showNumOfEmployees;
    else
      importantJobs = !importantJobs;
    update();
  }

  @override
  updateDropDownValue(String? newValue, String changingElement) {
    if (changingElement == "jobexperince") {
      jobExpirenceValue = newValue!;
    } else if (changingElement == "jobtype") {
      jobTypeValue = newValue!;
    } else if (changingElement == "remote") {
      remoteValue = newValue!;
    } else {
      majorValue = newValue!;
    }
    update();
  }
}
