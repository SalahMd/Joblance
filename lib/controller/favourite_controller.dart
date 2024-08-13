import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/job_info_model.dart';
import 'package:joblance/data/model/task_model.dart';
import 'package:joblance/data/remote/favourite_back.dart';
import 'package:joblance/data/remote/profile_back.dart';

abstract class FavouriteController extends GetxController {
  getSavedJobs();
  getFavouriteFreelancers();
  getFavoriteTasks();
}

class FavouriteControllerImpl extends FavouriteController {
  StatusRequest? statusRequest, addToFavouriteStatus;
  Myservices myServices = Get.find();
  FavouriteBack favorite = new FavouriteBack(Get.put(Crud()));
  late String token, role, lang, id;
  List<JobModel> jobs = [];
  List<TaskModel> tasks = [];
  List freelancers = [];
  late List<Widget> tabs = [];
  ProfileBack profileBack = new ProfileBack(Get.put(Crud()));

  @override
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    lang = myServices.sharedPreferences.getString("lang")!;
    role = myServices.sharedPreferences.getString("role_id")!;
    id = myServices.sharedPreferences.getInt("id").toString();
    if (role == "1") {
      tabs = [
        Tab(
          text: "freelancers".tr,
        ),
      ];
      getFavouriteFreelancers();
    } else {
      tabs = [
        Tab(
          text: "jobs".tr,
        ),
        Tab(text: "tasks".tr),
      ];
      getSavedJobs();
      getFavoriteTasks();
    }
    super.onInit();
  }

  getFavouriteFreelancers() async {
    statusRequest = StatusRequest.loading;
    var response = await favorite.getFavourite(token,
        AppLinks.favouriteFreelancer + "?lang=" + lang + "&user_id=" + id);
    statusRequest = handelingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        freelancers.addAll(response['data']);
      }
    }
    update();
  }

  getSavedJobs() async {
    statusRequest = StatusRequest.loading;
    var response = await favorite.getFavourite(
        token, AppLinks.favouriteJob + "?lang=" + lang + "&user_id=" + id);
    statusRequest = handelingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var data in response['data']) {
          jobs.add(JobModel.fromJson(data));
        }
      }
    }
    update();
  }

  getFavoriteTasks() async {
    statusRequest = StatusRequest.loading;
    var response = await favorite.getFavourite(
        token, AppLinks.favouriteTask + "?lang=" + lang + "&user_id=" + id);
    statusRequest = handelingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var data in response['data']) {
          tasks.add(TaskModel.fromJson(data));
        }
      }
    }
    update();
  }

  RemoveFavourite(int favId, bool isTask, int index) async {
    addToFavouriteStatus = StatusRequest.loading;
    var response;
    if (!isTask) {
      if (!jobs[index].isFavorite!)
        response = await favorite.addTaskAndJobsToFavourite(
            token, isTask, {"job_detail_id": favId.toString()});
      else
        response = await favorite.removeTaskAndJobsFromFavourite(
          token,
          favId.toString(),
          isTask,
        );
    } else {
      if (!tasks[index].isFavourite!)
        response = await favorite.addTaskAndJobsToFavourite(
            token, isTask, {"task_id": favId.toString()});
      else
        response = await favorite.removeTaskAndJobsFromFavourite(
          token,
          favId.toString(),
          isTask,
        );
    }
    addToFavouriteStatus = handelingData(response);
    if (StatusRequest.success == addToFavouriteStatus) {
      if (response['status'] == "success") {
        if (!isTask)
          jobs.removeAt(index);
        else
          tasks.removeAt(index);
      }
    }
    update();
  }

  RemoveFreelancer(int FreelancerId, int index, BuildContext context) async {
    print(id);
    addToFavouriteStatus = StatusRequest.loading;
    var response = await favorite.removeFreelancerFromFavourite(
        token, FreelancerId.toString());
    addToFavouriteStatus = handelingData(response);
    if (StatusRequest.success == addToFavouriteStatus) {
      if (response['status'] == "success") {
        freelancers.removeAt(index);
      } else {
        snackBar("", "couldn'tremoveformfavourite".tr, context);
      }
    } else {
      snackBar("", "couldn'tremoveformfavourite".tr, context);
    }
    update();
  }
}
