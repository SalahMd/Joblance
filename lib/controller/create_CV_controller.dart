import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/functions/date_picker.dart';
import 'package:joblance/core/services/services.dart';

import '../core/functions/show_countries.dart';

abstract class CreateCVController extends GetxController {}

class CreateCVControllerImpl extends CreateCVController {
  late TextEditingController fullName;
  late TextEditingController email;
  late TextEditingController major;
  late TextEditingController phoneNumber;
  late TextEditingController link;
  List<TextEditingController> skills = [TextEditingController()],
      certificates = [TextEditingController()],
      education = [TextEditingController()],
      experiences = [TextEditingController()];
  List edcationDates = [null], years = [null];
  late TextEditingController summary;
  String? country;
  var image;
  String birthDate = "";

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Myservices myservices = Get.find();
  @override
  void onInit() {
    fullName = TextEditingController();
    email = TextEditingController();
    major = TextEditingController();
    phoneNumber = TextEditingController();
    link = TextEditingController();
    summary = TextEditingController();
    skills[0] = TextEditingController();
    super.onInit();
  }

  void dispose() {
    fullName.dispose();
    email.dispose();
    super.dispose();
  }

  addSkill() {
    skills.add(TextEditingController());
    //skills[skills.length] = new TextEditingController();
    update();
  }

  addCertificate() {
    certificates.add(TextEditingController());
    //skills[skills.length] = new TextEditingController();
    update();
  }

  addEducation() {
    education.add(TextEditingController());
    edcationDates.add(null);
    //skills[skills.length] = new TextEditingController();
    update();
  }

  addExperience() {
    experiences.add(TextEditingController());
    years.add(null);
    update();
  }

  remove(int index, List item) {
    skills.removeAt(index);
    update();
  }

  pickBirthDate(BuildContext context) async {
    birthDate = await selectDate(context).toString();
    update();
  }

  updateCountry(BuildContext context) async {
    country = await showCountries(context);
    update();
  }
}
