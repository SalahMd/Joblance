import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/add_review_back.dart';

abstract class AddReviewController extends GetxController {
  postReview();
}

class AddReviewControllerImpl extends AddReviewController {
  final int id;
  late String token;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusRequest;
  AddReviewBack addReviewBack = new AddReviewBack(Get.put(Crud()));
  late TextEditingController review;
  double level = 4;
  Myservices myservices = Get.find();
  AddReviewControllerImpl({required this.id});

  void onInit() {
    review = TextEditingController();
    token = myservices.sharedPreferences.getString("token")!;
    super.onInit();
  }

  @override
  postReview() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;

      animationedAlert(AppAnimations.loadings, "pleasewait".tr);
      var response = await addReviewBack.postData({
        "user_id": id.toString(),
        "level": level.toString(),
        "comment": review.text
      }, token);
      statusRequest = handelingData(response);
      Get.back();

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();
          animationedAlert(AppAnimations.done, "yourreviewhasbeenposted".tr);
        } else
          print("error");
      } else {
        print("wwwwww");
      }
    }
  }
}
