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
import 'package:joblance/data/model/task_model.dart';
import 'package:joblance/data/remote/add_project_or_product_back.dart';
import 'package:joblance/data/remote/add_review_back.dart';
import 'package:joblance/data/remote/company/company_profile.dart';
import 'package:joblance/data/remote/favourite_back.dart';
import 'package:joblance/data/remote/job_info_back.dart';
import 'package:joblance/data/remote/task_back.dart';

abstract class MyAccountCompanyController extends GetxController {
  getUserData();
  getProduts();
  getReviews();
  getJobs();
}

class MyAccountCompanyControllerImpl extends MyAccountCompanyController {
  StatusRequest? statusRequest,addToFavouriteStatus;
  AddProjectOrProductBack addProjectOrProductBack =
      AddProjectOrProductBack(Get.put(Crud()));
  CompanyAccount companyAccount = new CompanyAccount(Get.put(Crud()));
  AddReviewBack addReviewBack = new AddReviewBack(Get.put(Crud()));
  Myservices myServices = Get.find();
  Map data = {};
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  List<TaskModel> tasks = [];
  List<JobModel> jobs = [];
  List<ReviewModel> reviews = [];
    FavouriteBack favourite = new FavouriteBack(Get.put(Crud()));

  List<ProjectOrProductModel> products = [];
  late String token, id, lang;
  JobBack jobBack = new JobBack(Get.put(Crud()));
  List<Widget> tabs = [
    Tab(
      text: "jobs".tr,
    ),
    Tab(
      text: "tasks".tr,
    ),
    Tab(text: "products".tr),
    Tab(
      text: "about".tr,
    ),
    Tab(text: "contact".tr),
  ];
  @override
  void onInit() async {
    lang = myServices.sharedPreferences.getString("lang")!;
    token = myServices.sharedPreferences.getString("token")!;
    id = myServices.sharedPreferences.getInt("id")!.toString();
    await getUserData();
    await getProduts();
    await getReviews();
    await getTasks();
    await getJobs();
    super.onInit();
  }

  Future<void> refreshPage() async {
    statusRequest = StatusRequest.loading;
    update();
    products.clear();
    data.clear();
    jobs.clear();
    reviews.clear();
    update();
    await getUserData();
    await getProduts();
    await getReviews();
    await getTasks();
    await getJobs();
  }

  @override
  getJobs() async {
    statusRequest = StatusRequest.loading;
    var response = await jobBack.getData(
        token, AppLinks.jobInfo + "?lang=" + lang + "&&company_id=" + id);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var data in response['data']) {
          jobs.add(JobModel.fromJson(data));
        }
      }
    }
    update();
  }

  getTasks() async {
    statusRequest = StatusRequest.loading;
    var response = await taskBack.getData(
        {}, AppLinks.task + "?user_id=" + id + "&&lang=" + lang, token);
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

  getUserData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await companyAccount.getData(token, id, lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      }
    }
    update();
  }
    addRemoveFavourite(int id, bool isTask) async {
    addToFavouriteStatus = StatusRequest.loading;
    var response;
    if (!isTask) {
      if (!jobs[id].isFavorite!)
        response = await favourite.addTaskAndJobsToFavourite(
            token, isTask, {"job_id": id.toString()});
      else
        response = await favourite.removeTaskAndJobsFromFavourite(
          token,
          id.toString(),
          isTask,
        );
    } else {
      if (!tasks[id].isFavourite!)
        response = await favourite.addTaskAndJobsToFavourite(
            token, isTask, {"task_id": id.toString()});
      else
        response = await favourite.removeTaskAndJobsFromFavourite(
          token,
          id.toString(),
          isTask,
        );
    }
    addToFavouriteStatus = handelingData(response);
    if (StatusRequest.success == addToFavouriteStatus) {
      if (response['status'] == "success") {
        if (!isTask)
          jobs[id].isFavorite = !jobs[id].isFavorite!;
        else
          tasks[id].isFavourite = !tasks[id].isFavourite!;
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
        for (int i = 0; i < response['data'].length; i++) {
          products.add(ProjectOrProductModel(
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

  void dispose() {
    super.dispose();
  }
}
