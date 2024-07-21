import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/job_info_model.dart';
import 'package:joblance/data/model/project_or_product_model.dart';
import 'package:joblance/data/model/review_model.dart';
import 'package:joblance/data/remote/add_project_or_product_back.dart';
import 'package:joblance/data/remote/add_review_back.dart';
import 'package:joblance/data/remote/follow_back.dart';
import 'package:joblance/data/remote/profile_back.dart';
import 'package:joblance/data/remote/task_back.dart';
import '../../data/model/task_model.dart';

abstract class CompanyProfileController extends GetxController {
  getReviews();
  getProduts();
  getUserData();
  getTasks();
}

class CompanyProfileControllerImpl extends CompanyProfileController {
  final int id;
  StatusRequest? statusRequest, followStatus;
  late String language, token;
  Myservices myServices = Get.find();
  AddProjectOrProductBack addProjectOrProductBack =
      AddProjectOrProductBack(Get.put(Crud()));
  AddReviewBack addReviewBack = new AddReviewBack(Get.put(Crud()));
  Map data = {};
  List<ReviewModel> reviews = [];
  List<TaskModel> tasks = [];
  List<JobModel> jobs = [];
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  FollowBack follow = new FollowBack(Get.put(Crud()));
  List<ProjectOrProductModel> products = [];
  bool followed = false;
  List<Widget> tabs = [
    Tab(
      text: "jobs".tr,
    ),
    Tab(
      text: "tasks".tr,
    ),
    Tab(text: "about".tr),
    Tab(text: "products".tr),
    Tab(text: "contact".tr)
  ];
  ProfileBack profileBack = new ProfileBack(Get.put(Crud()));
  CompanyProfileControllerImpl({required this.id});
  @override
  void onInit() async {
    language = myServices.sharedPreferences.getString("lang")!;
    token = myServices.sharedPreferences.getString("token")!;
    await getUserData();
    await getProduts();
    await getReviews();
    await getTasks();
    super.onInit();
  }

  getReviews() async {
    statusRequest = StatusRequest.loading;
    var response = await addReviewBack.getData({}, token, id.toString());
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var reviewData in response['data']) {
          reviews.add(ReviewModel.fromJson(reviewData));
        }
      }
    }
    update();
  }

  getTasks() async {
    statusRequest = StatusRequest.loading;
    var response = await taskBack.getData({},
        AppLinks.task + "?user_id=" + id.toString() + "&&lang=" + language,
        token);
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

  getUserData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileBack.getData(token, id.toString(), language);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        followed = data['followed'];
      }
    }
    update();
  }

  getProduts() async {
    statusRequest = StatusRequest.loading;
    var response =
        await addProjectOrProductBack.getData({}, AppLinks.project, token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var reviewData in response['data']) {
          products.add(ProjectOrProductModel.fromJson(reviewData));
        }
      }
    }
    update();
  }

  followUser() async {
    followStatus = StatusRequest.loading;
    var response = await follow.followUser(token, data['id'].toString());
    followStatus = handelingData(response);
    if (StatusRequest.success == followStatus) {
      if (response['status'] == "success") {
        followed = true;
      }
    }
    update();
  }

  unFollowUser() async {
    followStatus = StatusRequest.loading;
    var response = await follow.unFollowUser(token, data['id'].toString());
    followStatus = handelingData(response);
    if (StatusRequest.success == followStatus) {
      if (response['status'] == "success") {
        followed = false;
      }
    }
    update();
  }
}
