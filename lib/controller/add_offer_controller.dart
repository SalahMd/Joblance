import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/task_back.dart';

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
  late TextEditingController excutingTime;
  late TextEditingController yearsOfExperience;
  final int taskId;
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  Myservices myServices = Get.find();
  StatusRequest? statusRequest;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  AddOfferControllerImpl({required this.taskId});

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    phoneNumber = TextEditingController();
    offerInformation = TextEditingController();
    offerBudget = TextEditingController();
    excutingTime = TextEditingController();
    yearsOfExperience = TextEditingController();
    super.onInit();
  }

  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    offerBudget.dispose();
    phoneNumber.dispose();
    offerInformation.dispose();
    excutingTime.dispose();
    yearsOfExperience.dispose();
    super.dispose();
  }

  @override
  addOffer() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      String token = myServices.sharedPreferences.getString("token")!;
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "checkingdata".tr);
      var response = await taskBack.addOffer(
        token,
        {
          "task_id": taskId.toString(),
          "first_name": firstName.text,
          "last_name": lastName.text,
          "email": email.text,
          "phone": phoneNumber.text,
          "budget": offerBudget.text,
          "years_of_experience": yearsOfExperience.text,
          "excuting_time": excutingTime.text,
          "information": offerInformation.text
        },
      );
      statusRequest = handelingData(response);
      Get.back();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();
          animationedAlert(AppAnimations.done, "yourrequesthasbeensent".tr);
        } else
          animationedAlert(AppAnimations.wrong, "errorsendingyourrequest".tr);
      } else
        animationedAlert(AppAnimations.wrong, "errorsendingyourrequest".tr);
    }
  }
}
