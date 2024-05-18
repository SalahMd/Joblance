import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/project_or_product_model.dart';
import 'package:joblance/data/remote/add_project_or_product_back.dart';
import 'package:joblance/data/remote/freelancer/freelancer_profile.dart';
import 'package:joblance/data/remote/profile_back.dart';

abstract class MyAccountFreelancerController extends GetxController {
  addSkill(int id);
  searchSkill();
  deleteSkill(int id, int index);
  getSkills();
  getUserData();
  refreshPage();
}

class MyAccountFreelancerControllerImpl extends MyAccountFreelancerController {
  StatusRequest? statusRequest, skillStatus;
  Myservices myServices = Get.find();
  FreelancerAccount freelancerAccount = FreelancerAccount(Get.put(Crud()));
  late TextEditingController skill;
  late String token, id, language;
  AddProjectOrProductBack addProjectOrProductBack =
      new AddProjectOrProductBack(Get.put(Crud()));
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Map data = {};

  List skills = [];
  List userSkills = [];
  List<ProjectOrProductModel> projects = [];
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

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    update();
    token = myServices.sharedPreferences.getString("token")!;
    id = myServices.sharedPreferences.getInt("id")!.toString();
    language = myServices.sharedPreferences.getString("lang")!;
    await getUserData();
    await getSkills();
    await getProjects();

    skill = new TextEditingController();
    super.onInit();
  }

  Future<void> refreshPage() async {
    statusRequest = StatusRequest.loading;
    update();
    projects.clear();
    data.clear();
    userSkills.clear();
    update();
    await getUserData();
    await getProjects();
    await getSkills();
  }

  getProjects() async {
    var response =
        await addProjectOrProductBack.getData({}, AppLinks.project, token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (int i = 0; i < response['data'].length; i++) {
          projects.add(ProjectOrProductModel(
              id: response['data'][i]['id'],
              projectName: response['data'][i]['project_name'],
              projectDescription: response['data'][i]['project_description'],
              link: response['data'][i]['link'],
              userId: response['data'][i]['user_id']));
        }
      }
    }
    update();
  }

  getUserData() async {
    var response = await profileBack.getData(token, id, language);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      }
    }
    update();
  }

  void dispose() {
    skill.dispose();
    super.dispose();
  }

  Future<void> getSkills() async {
    skillStatus = StatusRequest.loading;
    var response = await freelancerAccount.getSkills(
      AppLinks.skills + "?id=" + id,
      token,
    );
    skillStatus = handelingData(response);
    if (StatusRequest.success == skillStatus) {
      if (response['status'] == "success") {
        userSkills.addAll(response['data']);
      }
    } else {}
    print(response);
    update();
  }

  Future<void> addSkill(int id) async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      skillStatus = StatusRequest.loading;
      var response =
          await freelancerAccount.addSkill(token, {"skill_id": id.toString()});
      skillStatus = handelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          {
            Get.back();
          }
        }
      }
    }

    update();
  }

  deleteSkill(int id, int index) async {
    Get.back();
    StatusRequest skillStatus = StatusRequest.loading;
    var response = await freelancerAccount.deleteSkill(token, id.toString());
    skillStatus = handelingData(response);
    if (StatusRequest.success == skillStatus) {
      if (response['status'] == "success") {
        userSkills.removeAt(index);
      } else {
        animationedAlert(AppAnimations.wrong, "couldn'tdeleteyourskill".tr);
      }
    } else {
      animationedAlert(AppAnimations.wrong, "couldn'tdeleteyourskill".tr);
    }
    update();
  }

  Future<void> searchSkill() async {
    // if (skill.text != "") {
    //   skillStatus = StatusRequest.loading;
    //   var response = await freelancerAccount.getSkills(
    //       "${AppLinks.skills}?search=$skill", token);
    //   skillStatus = handelingData(response);
    //   if (StatusRequest.success == statusRequest) {
    //     if (response['status'] == "success") {
    //       {
    //         skills.addAll(response['data']);
    //       }
    //     }
    //   }
    // }
    update();
  }
}
