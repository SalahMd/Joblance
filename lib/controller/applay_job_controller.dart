import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/applay_job_back.dart';

abstract class ApplayJobController extends GetxController {
  uploadCV();
  applay();
}

class ApplayJobControllerImpl extends ApplayJobController {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController phoneNumber;
  late TextEditingController coverLetter;
  var CV;
  ApplayJobBack applayJobBack = new ApplayJobBack(Get.put(Crud()));
  FilePickerResult? result;
  Myservices myServices = Get.find();
  StatusRequest? statusRequest;

  String? fileName;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    phoneNumber = TextEditingController();
    coverLetter = TextEditingController();
    super.onInit();
  }

  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phoneNumber.dispose();
    coverLetter.dispose();
    super.dispose();
  }

  @override
  uploadCV() async {
    result = await FilePicker.platform.pickFiles(
        allowedExtensions: ["jpg", "png", "gif", "pdf", "svg", "txt", "docx"],
        type: FileType.custom);
    if (result != null) {
      CV = File(result!.files.single.path!);
      fileName = result!.files.single.name;
      update();
    } else {}
  }

  @override
  applay() {
    var token = myServices.sharedPreferences.getString("token");
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = applayJobBack.postData({
        "first_name": firstName.text,
        "last_name": lastName.text,
        "email": email.text,
        "phone_number": phoneNumber.text,
        "cover_letter": coverLetter.text,
      }, token, CV);
      statusRequest = hadelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();
          animationedAlert(AppAnimations.done, "yourrequesthasbeensent".tr);
          update();
        }
        animationedAlert(AppAnimations.wrong, "errorsendingyourrequest".tr);
        update();
      }
    }
    statusRequest = StatusRequest.loading;
  }
}
