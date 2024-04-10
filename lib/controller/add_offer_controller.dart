import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/applay_job_back.dart';

abstract class AddOfferController extends GetxController {
  addOffer();
}

class AddOfferControllerImpl extends AddOfferController {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController phoneNumber;
  late TextEditingController offerBudget;
  late TextEditingController offerInformation;
  late TextEditingController duration;
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
    offerInformation = TextEditingController();
    offerBudget = TextEditingController();
    duration = TextEditingController();
    super.onInit();
  }

  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    offerBudget.dispose();
    phoneNumber.dispose();
    offerInformation.dispose();
    duration.dispose();
    super.dispose();
  }

  @override
  addOffer() {
    // var token = myServices.sharedPreferences.getString("token");
    // var formdata = formState.currentState;
    // if (formdata!.validate()) {

    //   statusRequest = StatusRequest.loading;
    //   animationedAlert(AppAnimations.loadings, "checkingdata".tr);
    //   var response = applayJobBack.postData({
    //     "first_name": firstName.text,
    //     "last_name": lastName.text,
    //     "email": email.text,
    //     "phone_number": phoneNumber.text,
    //     "cover_letter": coverLetter.text,
    //   }, token,);
    //   statusRequest = hadelingData(response);
    //   if (StatusRequest.success == statusRequest) {
    //     if (response['status'] == "success") {
    //       Get.back();
    //       animationedAlert(AppAnimations.done, "yourrequesthasbeensent".tr);
    //       update();
    //     }
    //     animationedAlert(AppAnimations.wrong, "errorsendingyourrequest".tr);
    //     update();
    //   }
    // }
  }
}
