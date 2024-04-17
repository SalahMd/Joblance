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
import 'package:joblance/core/functions/show_countries.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/auth/signup_back.dart';

abstract class SignUpController extends GetxController {
  goToLogiIn();
  goToSuccessfulSignUp();
  showPassword();
  pickImage();
  pickBirthDate(BuildContext context);
  changeState(bool isSale);
  isPasswordMatch();
  updateDropDownValue(String? newValue, String changingElement);
}

class SignUpControllerImpl extends SignUpController {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController aboutCompanyController;
  bool openToWork = false;
  String? googleEmail, name, imageUrl, googleFirstName, googleLastName;
  bool isGoogleSignin = false;
  bool isFreelancer = true;
  String birthDate = "";
  String studyCaseValue = '1', majorValue = '1', numOfEmployees = '1';
  Myservices myServices = Get.find();
  SignUpBack signUpBack = new SignUpBack(Get.put(Crud()));
  String? country;

  List<DropdownMenuItem<String>> studyCase = [
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
  List<DropdownMenuItem<String>> numOfEmployeesList = [
    DropdownMenuItem<String>(
      value: '1',
      child: Text("1 - 10"),
    ),
    DropdownMenuItem<String>(
      value: '2',
      child: Text("11 - 50"),
    ),
    DropdownMenuItem<String>(
      value: '3',
      child: Text("51 - 100"),
    ),
    DropdownMenuItem<String>(
      value: '4',
      child: Text("101 - 200"),
    ),
    DropdownMenuItem<String>(
      value: '5',
      child: Text("201 - 300"),
    ),
    DropdownMenuItem<String>(
      value: '6',
      child: Text("301 - 500"),
    ),
    DropdownMenuItem<String>(
      value: '7',
      child: Text("501 - 1000"),
    ),
    DropdownMenuItem<String>(
      value: '8',
      child: Text("1001 - 5000"),
    ),
    DropdownMenuItem<String>(
      value: '9',
      child: Text("5001 - 10000"),
    ),
    DropdownMenuItem<String>(
      value: '10',
      child: Text("+ 10000"),
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
  var image;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusRequest;
  bool isshown = true;

  @override
  showPassword() {
    isshown = !isshown;
    update();
  }

  changeOpenToWork() {
    openToWork = !openToWork;
    update();
  }

  @override
  goToLogiIn() {
    Get.offNamed("Login");
  }

  @override
  goToSuccessfulSignUp() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      if (!isPasswordMatch()) {
        animationedAlert(AppAnimations.wrong, "passworddoesntmatch".tr);
        update();
        return;
      }
      if (image != null) {
        if (country == null) {
          animationedAlert(AppAnimations.info, "pickupyourcounntry".tr);
          update();
          return;
        }
        statusRequest = StatusRequest.loading;
        animationedAlert(AppAnimations.loadings, "checkingdata".tr);
        update();
        
        var response = await signUpBack.signUp({
          "name": firstName.text,
          "first_name": firstName.text,
          "last_name": lastName.text,
          "email": email.text,
          "phone_number": phoneController.text,
          "password": passwordController.text,
          "is_company": isFreelancer ? "0" : "1",
          "major_id": majorValue,
          "description": aboutCompanyController.text,
          "study_case_id": studyCaseValue,
          "birth_date": birthDate,
          "num_of_employees": numOfEmployees,
          "open_to_work": openToWork ? "1" : "0",
          "location": country!,
        }, image);
        statusRequest = hadelingData(response);
        Get.back();
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            Get.offNamed("EmailVerification",
                arguments: {"email": email.text, "checkfor": "signup"});
          } else {
            Get.defaultDialog(title: "", middleText: "warningbody2".tr);
          }
        }
        update();
      } else {
        animationedAlert(AppAnimations.info, "pleaseaddanimage".tr);
      }
    }
  }

  @override
  void onInit() {
    phoneController = TextEditingController();
    lastName = TextEditingController();
    firstName = TextEditingController();
    email = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    aboutCompanyController = TextEditingController();
    Map<String, dynamic>? arguments = Get.arguments;
    googleEmail = arguments?['email'];
    name = arguments?['name'];
    imageUrl = arguments?['image'];
    googleFirstName = arguments?['first_name'];
    googleLastName = arguments?['last_name'];
    if (googleEmail != null) {
      isGoogleSignin = true;
      update();
    }

    super.onInit();
  }

  @override
  void dispose() {
    phoneController.dispose();
    lastName.dispose();
    firstName.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    email.dispose();
    aboutCompanyController.dispose();
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

  @override
  updateDropDownValue(String? newValue, String changingElement) {
    if (changingElement == "study") {
      studyCaseValue = newValue!;
      print(studyCaseValue);
    } else if (changingElement == "major") {
      majorValue = newValue!;
      print(majorValue);
    } else {
      numOfEmployees = newValue!;
      print(numOfEmployees);
    }
    update();
  }

  updateCountry(BuildContext context) async {
    country = await showCountries(context);
    update();
  }

  @override
  changeState(bool value) {
    isFreelancer = value;
    update();
  }

  @override
  pickBirthDate(BuildContext context) async {
    birthDate = await selectDate(context).toString();
    update();
  }

  @override
  bool isPasswordMatch() {
    return passwordController.text == confirmPasswordController.text;
  }

  googleSignUp() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      if (country == null) {
        animationedAlert(AppAnimations.info, "pickupyourcounntry".tr);
        update();
        return;
      }
      if (googleEmail == null || name == null || imageUrl == null) {
        animationedAlert(AppAnimations.wrong, "errorlwhileloggingin".tr);
        return;
      }
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "checkingdata".tr);
      var response = await signUpBack.googleSignUp(
        {
          "name": name,
          "first_name": googleFirstName,
          "last_name": googleLastName,
          "image": imageUrl,
          "email": googleEmail,
          "phone_number": phoneController.text,
          "is_company": isFreelancer ? "0" : "1",
          "major_id": majorValue,
          "birth_date": birthDate,
          "description": aboutCompanyController.text,
          "study_case_id": studyCaseValue,
          "num_of_employees": numOfEmployees,
          "open_to_work": openToWork ? "1" : "0",
          "location": country,
        },
      );
      statusRequest = hadelingData(response);
      Get.back();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences.setInt("id", response['data']["id"]);
          myServices.sharedPreferences
              .setString("token", response['data']["accessToken"]);
          myServices.sharedPreferences
              .setString("role_id", response['data']["type"].toString());
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed("HomePage");
        } else {
          animationedAlert(AppAnimations.wrong, "existednumber".tr);
          update();
        }
      }
    }
  }
}
