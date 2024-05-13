import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/functions/show_countries.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/edit_profile_back.dart';

abstract class EditProfileController extends GetxController {
  getUserInfo();
  initializeControllers();
  updateCountry(BuildContext context);
  updateDropDownValue(String? newValue, String changingElement);
}

class EditProfileControllerImpl extends EditProfileController {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController companyName;
  late TextEditingController phoneNumber;
  late TextEditingController description;
  late TextEditingController bio;
  String? image;
  EditProfileBack editProfileBack = new EditProfileBack(Get.put(Crud()));
  StatusRequest? statusRequest;
  bool openToWork = false;
  late String id, token, lang;
  String studyCase = "1", major = "1";
  String? country, birthOfDate, numOfEmployees = "1";
  late bool isFreelancer;
  Myservices myservices = Get.find();
  List<DropdownMenuItem<String>> studyCases = [
    DropdownMenuItem<String>(
      value: '1',
      child: Text("highschool".tr),
    ),
    DropdownMenuItem<String>(
      value: '2',
      child: Text("ungraduated".tr),
    ),
    DropdownMenuItem<String>(
      value: '3',
      child: Text("graduated".tr),
    ),
    DropdownMenuItem<String>(
      value: '4',
      child: Text("master".tr),
    ),
    DropdownMenuItem<String>(
      value: '5',
      child: Text("phd".tr),
    ),
  ];
  List<DropdownMenuItem<String>> majors = [
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
      child: Text("designing".tr),
    ),
    DropdownMenuItem<String>(
      value: '4',
      child: Text("medical".tr),
    ),
    DropdownMenuItem<String>(
      value: '5',
      child: Text("customerservicing".tr),
    ),
  ];
  Map data = {};
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  changeOpenToWork() {
    openToWork = !openToWork;
    update();
  }

  @override
  void onInit() {
    if (myservices.sharedPreferences.getString("role_id") == "1") {
      isFreelancer = false;
    } else {
      isFreelancer = true;
    }
    token = myservices.sharedPreferences.getString("token")!;
    id = myservices.sharedPreferences.getInt("id").toString();
    lang = myservices.sharedPreferences.getString("lang")!;

    initializeControllers();
    getUserInfo();
    super.onInit();
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
  }

  saveUserInfo() {
    if (myservices.sharedPreferences.getString("role_id") == "2") {
      firstName.text = data['first_name'];
      lastName.text = data['last_name'];
      bio.text = data['bio'];
      openToWork = data['open_to_work'] == 1 ? true : false;
    //  studyCase = data['study_case_id'].toString();
    } else {
      companyName.text = data['name'];
      description.text = data['description'];
    }
    country = data['location'];
    image = data['image'];
    phoneNumber.text = data['phone_number'];
  //  major = data['major_id'].toString();
    update();
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
