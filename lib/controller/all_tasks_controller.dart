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

abstract class AllTasksController extends GetxController {
  addRemoveFavourite(int id, int index);
  getTasks();
  refreshPage();
}

class AllTasksControllerImpl extends AllTasksController {
  StatusRequest? statusRequest, addToFavouriteStatus;
  FreeLnacerHomePageBack freeLnacerHomePageBack =
      new FreeLnacerHomePageBack(Get.put(Crud()));
  JobBack jobBack = new JobBack(Get.put(Crud()));
  late String language, token, id, name, image;
  Myservices myservices = Get.find();
  List<TaskModel> tasks = [];
  List<JobModel> jobs = [];
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  FavouriteBack favourite = new FavouriteBack(Get.put(Crud()));
  @override
  void onInit() async {
    token = myservices.sharedPreferences.getString("token")!;
    id = myservices.sharedPreferences.getInt("id").toString();
    language = myservices.sharedPreferences.getString("lang")!;
    super.onInit();
    await getTasks();
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

  addRemoveFavourite(int id, int index) async {
    addToFavouriteStatus = StatusRequest.loading;
    var response;
    if (!tasks[index].isFavourite!)
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
        tasks[index].isFavourite = !tasks[index].isFavourite!;
      }
    }
    update();
  }

  @override
  refreshPage() async {
    tasks.clear();
    await getTasks();
  }
}
