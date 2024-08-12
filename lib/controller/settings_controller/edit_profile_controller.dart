import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/functions/show_countries.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/company/company_home_page_back.dart';
import 'package:joblance/data/remote/edit_profile_back.dart';

abstract class EditProfileController extends GetxController {
  getUserInfo();
  initializeControllers();
  updateCountry(BuildContext context);
  updateUserData();
  pickImage();
  updateDropDownValue(String? newValue, String changingElement);
}

class EditProfileControllerImpl extends EditProfileController {
  late TextEditingController firstName,
      lastName,
      companyName,
      phoneNumber,
      description,
      bio;
  final BuildContext context;
  String? image;
  var newImage;
  EditProfileBack editProfileBack = new EditProfileBack(Get.put(Crud()));
  StatusRequest? statusRequest, updateStatusRequest;
  bool openToWork = false;
  String link = AppLinks.freelancers, studyCase = "1", major = "1";
  late String id, token, lang;
  String? country, birthOfDate, numOfEmployees = "1";
  late bool isFreelancer;
  Myservices myservices = Get.find();
  CompanyHomePageBack companyHomePageBack =
      new CompanyHomePageBack(Get.put(Crud()));
  late List<DropdownMenuItem<String>> studyCases = [];
  late List<DropdownMenuItem<String>> majors = [];
  Map data = {};
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  EditProfileControllerImpl({required this.context});
  changeOpenToWork() {
    openToWork = !openToWork;
    update();
  }

  @override
  void onInit() async {
    if (myservices.sharedPreferences.getString("role_id") == "1") {
      isFreelancer = false;
    } else {
      isFreelancer = true;
    }
    token = myservices.sharedPreferences.getString("token")!;
    id = myservices.sharedPreferences.getInt("id").toString();
    lang = myservices.sharedPreferences.getString("lang")!;
    initializeControllers();
    await getMajors();
    await getStudyCases();
    await getUserInfo();
    super.onInit();
  }

  getMajors() async {
    statusRequest = StatusRequest.loading;
    var response = await companyHomePageBack.getMajor(token, lang);
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

  getStudyCases() async {
    statusRequest = StatusRequest.loading;
    var response = await editProfileBack.getStudeCases(token, lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (int i = 0; i < response['data'].length; i++) {
          studyCases.add(DropdownMenuItem(
            value: response['data'][i]['id'].toString(),
            child: Text(response['data'][i]['name']),
          ));
        }
        print(majors);
      }
    }
    update();
  }

  void dispose() {
    firstName.dispose();
    lastName.dispose();
    description.dispose();
    bio.dispose();
    companyName.dispose();
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  Future<void> pickImage() async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      print(pickedImage.path);
      newImage = File(pickedImage.path);
    } else {
      print("Image picking canceled");
    }

    update();
  }

  getUserInfo() async {
    statusRequest = StatusRequest.loading;
    var response = await editProfileBack.getData(token, id, lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        saveUserInfo();
      }
    }
    update();
  }

  saveUserInfo() {
    if (myservices.sharedPreferences.getString("role_id") == "2") {
      firstName.text = data['first_name'];
      lastName.text = data['last_name'];
      bio.text = data['bio'];
      openToWork = data['open_to_work'] == 1 ? true : false;
      studyCase = data['study_case']['id'].toString();
    } else {
      companyName.text = data['name'];
      description.text = data['description'];
      link = AppLinks.company;
    }
    country = data['location'];
    image = data['image'];
    phoneNumber.text = data['phone_number'];
    major = data['major']['id'].toString();
    update();
  }

  updateUserData() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      updateStatusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "pleasewait".tr);
      var response = await editProfileBack.updateData(
          link,
          token,
          id,
          {
            "first_name": firstName.text,
            "last_name": lastName.text,
            "name": companyName.text,
            "phone_number": phoneNumber.text,
            "major_id": major,
            "study_case_id": studyCase,
            "description": description.text,
            "bio": bio.text,
            "open_to_work": openToWork ? "1" : "0",
            "location": country!,
          },
          newImage);
      updateStatusRequest = handelingData(response);
      Get.back();
      if (StatusRequest.success == updateStatusRequest) {
        if (response['status'] == "success") {
          Get.back();
          snackBar("", "yourdatahasbeensaved".tr, context);
        } else {
          snackBar("", "couldn'tsavedata".tr, context);
        }
      } else {
        snackBar("", "couldn'tsavedata".tr, context);
      }
    }
  }

  @override
  updateDropDownValue(String? newValue, String changingElement) {
    if (changingElement == "study") {
      studyCase = newValue!;
    } else if (changingElement == "major") {
      major = newValue!;
    } else {
      numOfEmployees = newValue!;
    }
    update();
  }

  updateCountry(BuildContext context) async {
    country = await showCountries(context);
    update();
  }

  initializeControllers() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    phoneNumber = TextEditingController();
    description = TextEditingController();
    companyName = TextEditingController();
    bio = TextEditingController();
  }
}
