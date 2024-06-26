import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/job_info_model.dart';
import 'package:joblance/data/model/task_model.dart';
import 'package:joblance/data/remote/freelancer/freelancer_home_page_back.dart';
import 'package:joblance/data/remote/job_info_back.dart';
import 'package:joblance/data/remote/task_back.dart';

abstract class FreelancerHomePageController extends GetxController {
  getFreelancerInfo();
  getJobs();
}

class FreelancerHomePageControllerImpl extends FreelancerHomePageController {
  StatusRequest? statusRequest;
  FreeLnacerHomePageBack freeLnacerHomePageBack =
      new FreeLnacerHomePageBack(Get.put(Crud()));
  JobBack jobBack = new JobBack(Get.put(Crud()));
  late String language, token, id;
  Myservices myservices = Get.find();
  late String name, image;
  List<TaskModel> tasks = [];
  List<JobModel> jobs = [];
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  @override
  void onInit() async {
    token = myservices.sharedPreferences.getString("token")!;
    id = myservices.sharedPreferences.getInt("id").toString();
    language = myservices.sharedPreferences.getString("lang")!;
    super.onInit();
    await getFreelancerInfo();
    await getTasks();
    await getJobs();
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
        if(response['data'].isNotEmpty)
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
    await getFreelancerInfo();
    await getTasks();
    await getJobs();
  }

  @override
  getJobs() async {
    statusRequest = StatusRequest.loading;
    var response = await jobBack.getData(token, AppLinks.jobInfo+"?lang="+language);
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
}
