import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/date_picker.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/create_CV_back.dart';

import '../core/functions/show_countries.dart';

abstract class CreateCVController extends GetxController {
  pickImage();
  generateCV();
}

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
  late String token;
  var image;
  String birthDate = "";
  StatusRequest? statusRequest;
  CreateCVBack createCVback = new CreateCVBack(Get.put(Crud()));

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
    token = myservices.sharedPreferences.getString("token")!;
    super.onInit();
  }

  void dispose() {
    fullName.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Future<void> pickImage() async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      print(pickedImage.path);
      image = File(pickedImage.path);
    } else {
      print("Image picking canceled");
    }

    update();
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

  @override
  generateCV() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "generatingyourcv".tr);
       // Prepare the data payload
      Map<String, dynamic> data = {
        "name": fullName.text,
        "email": email.text,
        "phone_number": phoneNumber.text,
        "major": major.text,
        "link": link.text,
        "location": country,
        "birth_date": birthDate,
        "summary": summary.text,
      };
      for (int i = 0; i < skills.length; i++) {
        data["skills[$i]"] = skills[i].text;
      }
      for (int i = 0; i < certificates.length; i++) {
        data["certificates[$i]"] = certificates[i].text;
      }
      for (int i = 0; i < education.length; i++) {
        data["education[$i]"] = education[i].text;
        data["educationDates[$i]"] = edcationDates[i]; 
      }
      for (int i = 0; i < experiences.length; i++) {
        data["experiences[$i]"] = experiences[i].text;
        data["years[$i]"] = years[i]; 
      }
      var response = await createCVback.postData(data, image, token);
      statusRequest = handelingData(response);
      Get.back();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          animationedAlert(
              AppAnimations.done, "yourcvhasbeengeneratedsuccessfully".tr);
          Get.back();
        }
      }
    }
  }
}
