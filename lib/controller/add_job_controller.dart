import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/view/screens/job_info/about_company.dart';

abstract class AddjobController extends GetxController {
  addJob();
  getJobData();
  updateDropDownValue(String? newValue, String changingElement);
}

class AddjobControllerImpl extends AddjobController {
  late TextEditingController aboutJob;
  late TextEditingController additionalInfo;
  late TextEditingController requirements;
  late TextEditingController salary;
  late TextEditingController jobTitle;

  bool showNumOfEmployees = false;
  bool showAboutCompany = false;
  // List jobType = [];
  // List jobExperience = [];
  // List remote = [];
  String jobTypeValue = '1';
  String remoteValue = '1';
  String jobExpirenceValue = '1';
  String majorValue = '1';

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
  List<DropdownMenuItem<String>> major = [
    DropdownMenuItem<String>(
      value: '1',
      child: Text("engineering".tr),
    ),
    DropdownMenuItem<String>(
      value: '2',
      child: Text("technology".tr),
    ),
    DropdownMenuItem<String>(
      value: '3',
      child: Text("medical".tr),
    ),
    DropdownMenuItem<String>(
      value: '4',
      child: Text("designing".tr),
    ),
    DropdownMenuItem<String>(
      value: '5',
      child: Text("customer-service".tr),
    ),
  ];

  @override
  onInit() {
    aboutJob = new TextEditingController();
    additionalInfo = new TextEditingController();
    requirements = new TextEditingController();
    salary = new TextEditingController();
    jobTitle = new TextEditingController();
    super.onInit();
  }

  @override
  dispose() {
    aboutJob.dispose();
    additionalInfo.dispose();
    requirements.dispose();
    salary.dispose();
    jobTitle.dispose();
    super.dispose();
  }

  @override
  addJob() {}

  @override
  getJobData() {
    // TODO: implement getJobData
    throw UnimplementedError();
  }

  changeCheckBoxValue(String box) {
    if (box == "aboutcompany")
      showAboutCompany = !showAboutCompany;
    else if (box == "showemployees") showNumOfEmployees = !showNumOfEmployees;
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
