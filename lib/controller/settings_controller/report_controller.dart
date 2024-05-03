import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/report_back.dart';

abstract class ReportController extends GetxController {}

class ReportControllerImpl extends ReportController {
  late TextEditingController reportTitle;
  late TextEditingController reportbody;
  StatusRequest? statusRequest;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Myservices myservices = Get.find();
  ReportBack reportBack = ReportBack(Get.put(Crud()));
  @override
  void onInit() {
    reportTitle = TextEditingController();
    reportbody = TextEditingController();
    super.onInit();
  }

  void dispose() {
    reportTitle.dispose();
    reportbody.dispose();
    super.dispose();
  }

  sendReport() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "sendingyourreport".tr);
      String token = myservices.sharedPreferences.getString("token")!;
      var response = await reportBack.postData(
          {"title": reportTitle.text, "body": reportbody.text}, token);
      statusRequest = handelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();
          reportTitle.clear();
          reportbody.clear();
          animationedAlert(AppAnimations.done, "yourreporthasbeensent".tr);
        }
      }
    }
  }
}
