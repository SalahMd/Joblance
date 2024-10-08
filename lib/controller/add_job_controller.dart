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
  addJob(bool isUpdate, BuildContext context);
  getMajors();
  changeCheckBoxValue(String box);
  updateDropDownValue(String? newValue, String changingElement);
  getExperience();
}

class AddjobControllerImpl extends AddjobController {
  late TextEditingController jobLocation,
      jobTitle,
      requirements,
      aboutJob,
      salary,
      additionalInfo;
  late String token, language;
  StatusRequest? statusRequest;
  Myservices myservices = Get.find();
  int? id;
  JobBack jobBack = new JobBack(Get.put(Crud()));
  bool showAboutCompany = false,
      showNumOfEmployees = false,
      importantJobs = false,
      active = true;
  String majorValue = '1',
      remoteValue = '1',
      jobTypeValue = '1',
      jobExpirenceValue = '1';
  List<DropdownMenuItem<String>> jobType = [
    DropdownMenuItem<String>(
      value: '1',
      child: Text("fulltime".tr),
    ),
    DropdownMenuItem<String>(
      value: '2',
      child: Text("parttime".tr),
    ),
    DropdownMenuItem<String>(
      value: '3',
      child: Text("temporary".tr),
    ),
  ];
  List<DropdownMenuItem<String>> remote = [
    DropdownMenuItem<String>(
      value: '1',
      child: Text("onsite".tr),
    ),
    DropdownMenuItem<String>(
      value: '2',
      child: Text("remote".tr),
    ),
    DropdownMenuItem<String>(
      value: '3',
      child: Text("hybrid".tr),
    ),
  ];
  List<DropdownMenuItem<String>> jobExperience = [];
  CompanyHomePageBack companyHomePageBack =
      new CompanyHomePageBack(Get.put(Crud()));
  List<DropdownMenuItem<String>> majors = [];
  GlobalKey<FormState> formState = GlobalKey<FormState>();

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
    await getExperience();
    if (Get.arguments != null) {
      jobTitle.text = Get.arguments['title'] as String;
      aboutJob.text = Get.arguments['about_job'] as String;
      requirements.text = Get.arguments['requirements'] as String;
      majorValue = Get.arguments['major_id'].toString();
      remoteValue = Get.arguments['remote_id'].toString();
      jobTypeValue = Get.arguments['job_type_id'].toString();
      jobExpirenceValue = Get.arguments['experience_level_id'].toString();
      active = Get.arguments['active'] == 1 ? true : false;
      showAboutCompany =
          Get.arguments['show_about_the_company'] == 0 ? false : true;
      showNumOfEmployees =
          Get.arguments['show_number_of_employees'] == 0 ? false : true;
      id = Get.arguments['id'];
      if (Get.arguments['additional_information'] != null) {
        additionalInfo.text = Get.arguments['additional_information'] as String;
      }
      if (Get.arguments['salary'] != null) {
        salary.text = Get.arguments['salary'].toString();
      }
      if (Get.arguments['location'] != null) {
        jobLocation.text = Get.arguments['location'].toString();
      }
    }

    super.onInit();
  }

  changeJobStatus() {
    active = !active;
    update();
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
  }

  getExperience() async {
    statusRequest = StatusRequest.loading;
    var response = await companyHomePageBack.getExperience(token, language);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (int i = 0; i < response['data'].length; i++) {
          jobExperience.add(DropdownMenuItem(
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
  addJob(bool isUpdate, BuildContext context) async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "pleasewait".tr);
      var response;
      Map data = {
        "title": jobTitle.text,
        "about_job": aboutJob.text,
        "salary": salary.text,
        "location": jobLocation.text,
        "job_type_id": jobTypeValue,
        "major_id": majorValue,
        "remote_id": remoteValue,
        "requirements": requirements.text,
        "additional_information": additionalInfo.text,
        "experience_level_id": jobExpirenceValue,
        "show_about_the_company": showAboutCompany ? "1" : "0",
        "show_number_of_employees": showNumOfEmployees ? "1" : "0",
        "active": active ? "1" : "0"
      };
      if (!isUpdate)
        response = await jobBack.postData(token, data);
      else
        response = await jobBack.updateData(token, id.toString(), data);
      statusRequest = handelingData(response);
      Get.back();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();

          snackBar(
              "",
              !isUpdate ? "yourjobhasbeenposted".tr : "yourjobhasbeenupdated",
              context);
        } else {
          animationedAlert(AppAnimations.wrong, "couldn'tpostyourjob".tr);
        }
      } else {
        animationedAlert(AppAnimations.wrong, "couldn'tpostyourjob".tr);
      }
    }
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
