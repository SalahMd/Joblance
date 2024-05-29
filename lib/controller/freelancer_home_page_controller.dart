import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/task_model.dart';
import 'package:joblance/data/remote/freelancer/freelancer_home_page_back.dart';
import 'package:joblance/data/remote/task_back.dart';

abstract class FreelancerHomePageController extends GetxController {
  getFreelancerInfo();
  getJobs();
}

class FreelancerHomePageControllerImpl extends FreelancerHomePageController {
  StatusRequest? statusRequest;
  FreeLnacerHomePageBack freeLnacerHomePageBack =
      new FreeLnacerHomePageBack(Get.put(Crud()));
  String? token, id;
  String language = 'en';
  Myservices myservices = Get.find();
  late String name = "", image = "";
  List<TaskModel> tasks = [];
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  @override
  void onInit() async {
    token = myservices.sharedPreferences.getString("token")!;
    id = myservices.sharedPreferences.getInt("id").toString();
    // language = myservices.sharedPreferences.getString("lang");
    super.onInit();
    await getFreelancerInfo();
    await getTasks();
  }

  getFreelancerInfo() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await freeLnacerHomePageBack.getFreelancerInfo(token, language, id!);
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
    var response = await taskBack.getData({}, AppLinks.task+"?user_id=2", token);
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

  refreshPage() async {
    await getFreelancerInfo();
    await getTasks();
  }

  @override
  getJobs() {
    throw UnimplementedError();
  }
}
