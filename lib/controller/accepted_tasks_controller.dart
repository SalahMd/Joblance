import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/accepted_task_model.dart';
import 'package:joblance/data/remote/freelancer/freelancer_home_page_back.dart';
import 'package:joblance/data/remote/task_back.dart';

abstract class AcceptedTasksController extends GetxController {
  getTasks();
}

class AcceptedTasksControllerImpl extends AcceptedTasksController {
  StatusRequest? statusRequest, addToFavouriteStatus;
  FreeLnacerHomePageBack freeLnacerHomePageBack =
      new FreeLnacerHomePageBack(Get.put(Crud()));
  late String language, token;
  Myservices myservices = Get.find();
  List<AcceptedTaskModel> tasks = [];
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  @override
  void onInit() async {
    token = myservices.sharedPreferences.getString("token")!;
    language = myservices.sharedPreferences.getString("lang")!;
    super.onInit();
    await getTasks();
  }

  getTasks() async {
    statusRequest = StatusRequest.loading;
    var response = await taskBack
        .getData({}, AppLinks.acceptedTasks + "?lang=" + language, token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data'].isNotEmpty)
            for (var data in response['data']) {
              tasks.add(AcceptedTaskModel.fromJson(data));
            }
     
      }
    }
    update();
  }
}
