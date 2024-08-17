import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/job_info_model.dart';
import 'package:joblance/data/model/task_model.dart';
import 'package:joblance/data/remote/favourite_back.dart';
import 'package:joblance/data/remote/freelancer/freelancer_home_page_back.dart';
import 'package:joblance/data/remote/job_info_back.dart';
import 'package:joblance/data/remote/task_back.dart';

abstract class FreelancerHomePageController extends GetxController {
  getFreelancerInfo();
  getJobs();
  addRemoveFavourite(int id, bool isTask, int index);
  getTasks();
  getImportantJobs();
  refreshPage();
}

class FreelancerHomePageControllerImpl extends FreelancerHomePageController {
  StatusRequest? statusRequest, addToFavouriteStatus;
  FreeLnacerHomePageBack freeLnacerHomePageBack =
      new FreeLnacerHomePageBack(Get.put(Crud()));
  JobBack jobBack = new JobBack(Get.put(Crud()));
  late String language, token, id, name, image;
  Myservices myservices = Get.find();
  List<TaskModel> tasks = [];
  List<JobModel> jobs = [];
  List<JobModel> importantJobs = [];
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  FavouriteBack favourite = new FavouriteBack(Get.put(Crud()));
  @override
  void onInit() async {
    token = myservices.sharedPreferences.getString("token")!;
    id = myservices.sharedPreferences.getInt("id").toString();
    language = myservices.sharedPreferences.getString("lang")!;
    super.onInit();
    await getFreelancerInfo();
    await getTasks();
    await getJobs();
    await getImportantJobs();
  }

  getFreelancerInfo() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await freeLnacerHomePageBack.getFreelancerInfo(token, language, id);
    statusRequest = handelingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        name = response['data']['first_name'];
        image = response['data']['image'];
      }
    }
    update();
  }

  getTasks() async {
    statusRequest = StatusRequest.loading;
    var response =
        await taskBack.getData({}, AppLinks.task + "?lang=" + language, token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data'].isNotEmpty)
          for (var data in response['data']) {
            tasks.add(TaskModel.fromJson(data));
          }
      }
    }
    update();
  }

  refreshPage() async {
    tasks.clear();
    jobs.clear();
    importantJobs.clear();
    await getFreelancerInfo();
    await getTasks();
    await getJobs();
    await getImportantJobs();
  }

  @override
  getJobs() async {
    statusRequest = StatusRequest.loading;
    var response =
        await jobBack.getData(token, AppLinks.jobInfo + "?lang=" + language);
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

  addRemoveFavourite(int id, bool isTask, int index) async {
    addToFavouriteStatus = StatusRequest.loading;
    var response;
    if (!isTask) {
      if (!jobs[index].isFavorite!)
        response = await favourite.addTaskAndJobsToFavourite(
            token, isTask, {"job_detail_id": id.toString()});
      else
        response = await favourite.removeTaskAndJobsFromFavourite(
          token,
          id.toString(),
          isTask,
        );
    } else {
      if (!tasks[index].isFavourite!)
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
          jobs[index].isFavorite = !jobs[index].isFavorite!;
        else
          tasks[index].isFavourite = !tasks[index].isFavourite!;
      }
    }
    update();
  }

  getImportantJobs() async {
    statusRequest = StatusRequest.loading;
    var response = await jobBack.getData(
        token, AppLinks.importantJob + "?lang=" + language);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var data in response['data']) {
          importantJobs.add(JobModel.fromJson(data));
        }
      }
    }
    update();
  }
}
