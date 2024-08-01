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
import 'package:joblance/data/model/task_model.dart';
import 'package:joblance/data/remote/add_project_or_product_back.dart';
import 'package:joblance/data/remote/budget_back.dart';
import 'package:joblance/data/remote/favourite_back.dart';
import 'package:joblance/data/remote/freelancer/freelancer_profile.dart';
import 'package:joblance/data/remote/profile_back.dart';
import 'package:joblance/data/remote/task_back.dart';

abstract class MyAccountFreelancerController extends GetxController {
  addSkill(int id, BuildContext context);
  searchSkill();
  deleteSkill(int id, int index);
  getSkills();
  getUserData();
  refreshPage();
  getBudget();
  getTasks();
}

class MyAccountFreelancerControllerImpl extends MyAccountFreelancerController {
  StatusRequest? statusRequest, skillStatus, addToFavouriteStatus;
  Myservices myServices = Get.find();
  FreelancerAccount freelancerAccount = FreelancerAccount(Get.put(Crud()));
  late TextEditingController skill;
  late String token, id, language;
  AddProjectOrProductBack addProjectOrProductBack =
      new AddProjectOrProductBack(Get.put(Crud()));
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Map data = {};
  FavouriteBack favourite = FavouriteBack(Get.put(Crud()));
  List<TaskModel> tasks = [];
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  List userSkills = [], skills = [];
  List<ProjectOrProductModel> projects = [];
  double balance = 0;
  BudgetBack budgetBack = new BudgetBack(Get.put(Crud()));
  List<Widget> tabs = [
    Tab(
      text: "about".tr,
    ),
    Tab(text: "projects".tr),
    Tab(
      text: "skills".tr,
    ),
    Tab(text: "tasks".tr),
    Tab(text: "contact".tr),
  ];
  ProfileBack profileBack = new ProfileBack(Get.put(Crud()));

  @override
  void onInit() async {
    token = myServices.sharedPreferences.getString("token")!;
    id = myServices.sharedPreferences.getInt("id")!.toString();
    language = myServices.sharedPreferences.getString("lang")!;
    await getUserData();
    await getSkills();
    await getProjects();
    await getTasks();
    await getBudget();
    skill = new TextEditingController();
    super.onInit();
  }

  Future<void> refreshPage() async {
    projects.clear();
    data.clear();
    tasks.clear();
    userSkills.clear();
    update();
    await getUserData();
    await getProjects();
    await getSkills();
    await getTasks();
    await getBudget();
  }

  getProjects() async {
    statusRequest = StatusRequest.loading;
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
    statusRequest = StatusRequest.loading;
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
    statusRequest = StatusRequest.loading;
    var response = await freelancerAccount.getSkills(
      AppLinks.skills + "?id=" + id,
      token,
    );
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        userSkills.addAll(response['data']);
      }
    } else {}
    print(response);
    update();
  }

  getTasks() async {
    statusRequest = StatusRequest.loading;
    var response = await taskBack.getData(
        {}, AppLinks.task + "?user_id=" + id + "&&lang=" + language, token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var reviewData in response['data']) {
          tasks.add(TaskModel.fromJson(reviewData));
        }
      }
    }
    update();
  }

  Future<void> addSkill(int? id, BuildContext context) async {
    skillStatus = StatusRequest.loading;
    var response = await freelancerAccount.addSkill(
        token, {"skill_id": id.toString()}, AppLinks.skills);
    skillStatus = handelingData(response);
    Get.back();

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        snackBar("", "yourskillhasbeenadded".tr, context);
      } else
        snackBar("", "yourskillhasbeenadded".tr, context);
    } else
      snackBar("", "yourskillhasbeenadded".tr, context);

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

  addRemoveFavourite(int id) async {
    addToFavouriteStatus = StatusRequest.loading;
    var response;

    if (!tasks[id].isFavourite!)
      response = await favourite
          .addTaskAndJobsToFavourite(token, true, {"task_id": id.toString()});
    else
      response = await favourite.removeTaskAndJobsFromFavourite(
        token,
        id.toString(),
        true,
      );

    addToFavouriteStatus = handelingData(response);
    if (StatusRequest.success == addToFavouriteStatus) {
      if (response['status'] == "success") {
        tasks[id].isFavourite = !tasks[id].isFavourite!;
      }
    }
    update();
  }

  searchSkill() async {
    skills.clear();
    update();
    if (skill.text != "") {
      skillStatus = StatusRequest.loading;
      var response = await freelancerAccount.getSkills(
        AppLinks.IP + "/api/skills/search" + "?search=" + skill.text,
        token,
      );
      skillStatus = handelingData(response);
      update();
      if (StatusRequest.success == skillStatus) {
        if (response['status'] == "success") {
          skills.addAll(response['data']);
          update();
        }
      }
    }
  }

  @override
  getBudget() async {
    statusRequest = StatusRequest.loading;
    var response = await budgetBack.getData(token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        balance = response['data']["balance"].toDouble();
      }
    }
    update();
  }
}
