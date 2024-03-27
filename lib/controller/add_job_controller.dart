import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/images.dart';

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
  late TextEditingController jobLocation;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("engineering".tr),
          Container(
            width: 25.w,
            height: 25.h,
            child: Image.asset(
              AppImages.cat3,
              width: 25.w,
              height: 25.h,
            ),
          )
        ],
      ),
    ),
    DropdownMenuItem<String>(
      value: '2',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("technology".tr),
          Container(
            width: 25.w,
            height: 25.h,
            child: Image.asset(
              AppImages.cat5,
              width: 25.w,
              height: 25.h,
            ),
          )
        ],
      ),
    ),
    DropdownMenuItem<String>(
      value: '3',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("medical".tr),
          Container(
            width: 25.w,
            height: 25.h,
            child: Image.asset(
              AppImages.cat4,
              width: 25.w,
              height: 25.h,
            ),
          )
        ],
      ),
    ),
    DropdownMenuItem<String>(
      value: '4',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("designing".tr),
          Container(
            width: 25.w,
            height: 25.h,
            child: Image.asset(
              AppImages.cat2,
              width: 25.w,
              height: 25.h,
            ),
          )
        ],
      ),
    ),
    DropdownMenuItem<String>(
      value: '5',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("customer-service".tr),
          Container(
            width: 25.w,
            height: 25.h,
            child: Image.asset(
              AppImages.cat6,
              width: 25.w,
              height: 25.h,
            ),
          )
        ],
      ),
    ),
  ];

  @override
  onInit() {
    aboutJob = new TextEditingController();
    additionalInfo = new TextEditingController();
    requirements = new TextEditingController();
    salary = new TextEditingController();
    jobLocation = new TextEditingController();
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
    jobLocation.dispose();
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
