import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/job_info_model.dart';
import 'package:joblance/data/model/task_model.dart';
import 'package:joblance/data/remote/search_back.dart';

abstract class SearchController extends GetxController {
  filterData();
}

class SearchControllerImpl extends SearchController {
  bool isJob = false;
  StatusRequest? statusRequest, searchStatus;
  Myservices myservices = Get.find();
  late String lang, token;
  var role;
  SearchBack searchBack = new SearchBack(Get.put(Crud()));
  TextEditingController search = new TextEditingController();
  List<JobModel> jobs = [];
  List<Map<String, String>> jobExperience = [];
  List<String> remote = [];
  List<String> jobType = [];
  List<Map<String, String>> majors = [];
  late List<Widget> tabs = [];
  List<TaskModel> tasks = [];
  List freelancers = [];
  int index = 0;
  String jobTypeFilter = '',
      experienceFilter = '',
      majorFilter = '',
      remoteFilter = '',
      durationFilter = '';
  void onInit() async {
    lang = myservices.sharedPreferences.getString("lang")!;
    token = myservices.sharedPreferences.getString("token")!;
    role = myservices.sharedPreferences.getString("role_id")!;
    if (role == "1") {
      tabs = [
        Tab(
          text: "freelancers".tr,
        ),
        Tab(
          text: "jobs".tr,
        ),
      ];
    } else {
      tabs = [
        Tab(text: "tasks".tr),
        Tab(
          text: "jobs".tr,
        ),
      ];
    }
    await getMajors();
    await getExperience();
    super.onInit();
  }

  getMajors() async {
    statusRequest = StatusRequest.loading;
    var response = await searchBack.getMajor(token, lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (int i = 0; i < response['data'].length; i++) {
          majors.add({
            response['data'][i]['id'].toString(): response['data'][i]['name']
          });
        }
        //majors.addAll(response['data']);
        print(majors);
      }
    }
  }

  getExperience() async {
    statusRequest = StatusRequest.loading;
    var response = await searchBack.getExperience(token, lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (int i = 0; i < response['data'].length; i++) {
          jobExperience.add({
            response['data'][i]['id'].toString(): response['data'][i]['name']
          });
        }

        print(majors);
      }
    }
    update();
  }

  searchTasks() async {
    if (search == '') return;
    tasks.clear();
    statusRequest = StatusRequest.loading;
    var response = await searchBack.search(
        token,
        AppLinks.task +
            "?lang=" +
            lang +
            "&task_title=" +
            search.text +
            "&major=" +
            majorFilter +
            "&duration=" +
            durationFilter);
    statusRequest = handelingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var data in response['data']) {
          tasks.add(TaskModel.fromJson(data));
        }
      }
    }
    jobTypeFilter = '';
    experienceFilter = '';
    majorFilter = '';
    durationFilter = '';
    remoteFilter = '';
    update();
  }

  searchFreelancers() async {
    if (search == '') return;
    jobs.clear();
    print(search.text);
    searchStatus = StatusRequest.loading;
    var response = await searchBack.search(
        token,
        AppLinks.user +
            "/freelancer" +
            "?lang=" +
            lang +
            "&name=" +
            search.text);
    searchStatus = handelingData(response);
    if (StatusRequest.success == searchStatus) {
      if (response['status'] == "success") {
        freelancers.addAll(response['data']);
      }
    }
    update();
  }

  searchJobs(bool isFilter) async {
    if (search == '') return;
    jobs.clear();
    searchStatus = StatusRequest.loading;
    var response = await searchBack.search(
        token,
        AppLinks.jobInfo +
            "?lang=" +
            lang +
            "&title=" +
            search.text +
            "&major=" +
            majorFilter +
            "&experience_level=" +
            experienceFilter +
            "&remote_type=" +
            remoteFilter +
            "&job_type=" +
            jobTypeFilter);
    searchStatus = handelingData(response);
    if (StatusRequest.success == searchStatus) {
      if (response['status'] == "success") {
        for (var data in response['data']) {
          jobs.add(JobModel.fromJson(data));
        }
        print(jobs);
      }
    }
    jobTypeFilter = '';
    experienceFilter = '';
    majorFilter = '';
    remoteFilter = '';
    update();
  }

  updateSeach(String filter, String val) {
    if (filter == "jobtype") {
      jobTypeFilter = val;
    } else if (filter == "experience") {
      experienceFilter = val;
    } else if (filter == "majors") {
      majorFilter = val;
    } else if (filter == "duration") {
      if (val == 'high'.tr)
        durationFilter = '1';
      else
        durationFilter = '0';
    } else {
      remoteFilter = val;
    }
    update();
    //searchJobs(true);
  }

  @override
  filterData() {}
}
