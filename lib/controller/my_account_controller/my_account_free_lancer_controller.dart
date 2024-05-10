import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/freelancer/freelancer_profile.dart';
import 'package:joblance/data/remote/profile_back.dart';

abstract class MyAccountFreelancerController extends GetxController {
  addSkill();
  searchSkill();
  deleteSkill(int id);
  getSkills();
}

class MyAccountFreelancerControllerImpl extends MyAccountFreelancerController {
  StatusRequest? statusRequest, skillStatus;
  Myservices myServices = Get.find();
  FreelancerAccount freelancerAccount = new FreelancerAccount(Get.put(Crud()));
  late TextEditingController skill;
  late String token;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  List data = [];
  List skills = [];
  List userSkills = [];
  List<Widget> tabs = [
    Tab(
      text: "about".tr,
    ),
    Tab(text: "projects".tr),
    Tab(
      text: "skills".tr,
    ),
    Tab(text: "contact".tr),
  ];
  ProfileBack profileBack = new ProfileBack(Get.put(Crud()));
  displayData() async {}

  @override
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    //displayData();
    skill = new TextEditingController();
    super.onInit();
  }

  void dispose() {
    skill.dispose();
    super.dispose();
  }

  Future<void> getSkills() async {
    skillStatus = StatusRequest.loading;
    var response = await freelancerAccount.getSkills(AppLinks.skills, token);
    skillStatus = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        {
          userSkills.addAll(response['data']);
        }
      }
    }
    update();
  }

  Future<void> addSkill() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      skillStatus = StatusRequest.loading;
      var response =
          await freelancerAccount.addSkill(token, {"skill": skill.text});
      skillStatus = handelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          {}
        }
      }
    }

    update();
  }



  deleteSkill(int id) async {
    Get.back();
    StatusRequest skillStatus = StatusRequest.loading;
    var response = await freelancerAccount.deleteSkill(token, id.toString());
    skillStatus = handelingData(response);
    if (StatusRequest.success == skillStatus) {
      if (response['status'] == "success") {
        skills.removeAt(id);
      } else {
        animationedAlert(AppAnimations.wrong, "couldn'tdeleteyourskill".tr);
      }
    } else {
      animationedAlert(AppAnimations.wrong, "couldn'tdeleteyourskill".tr);
    }
    update();
  }

  Future<void> searchSkill() async {
    if (skill.text != "") {
      skillStatus = StatusRequest.loading;
      var response = await freelancerAccount.getSkills(
          "${AppLinks.skills}?search=$skill", token);
      skillStatus = handelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          {
            skills.addAll(response['data']);
          }
        }
      }
    }
    update();
  }
}
