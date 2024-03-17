import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';

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
  File? file;
  FilePickerResult? result;
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
      file = File(result!.files.single.path!);
      fileName = result!.files.single.name;
      update();
    } else {}
  }

  @override
  applay() {
    Get.back();
    animationedAlert(AppAnimations.done, "yourrequesthasbeensent".tr);
    update();
  }
}
