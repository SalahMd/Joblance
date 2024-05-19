import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/services/services.dart';

abstract class CreateCVController extends GetxController {}

class CreateCVControllerImpl extends CreateCVController {
  late TextEditingController fullName;
  late TextEditingController email;
  late TextEditingController major;
  late TextEditingController phoneNumber;
  late TextEditingController link;
  late TextEditingController skills;
  String country = "";
  var image;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Myservices myservices = Get.find();
  @override
  void onInit() {
    fullName = TextEditingController();
    email = TextEditingController();
    super.onInit();
  }

  void dispose() {
    fullName.dispose();
    email.dispose();
    super.dispose();
  }
}
