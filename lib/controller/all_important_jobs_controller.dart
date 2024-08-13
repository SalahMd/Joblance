import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/job_info_model.dart';
import 'package:joblance/data/remote/favourite_back.dart';
import 'package:joblance/data/remote/job_info_back.dart';

abstract class AllImportantJobsController extends GetxController {
  getImportantJobs();
  addRemoveFavourite(int id, int index);
}

class AllImportantJobsControllerImpl extends AllImportantJobsController {
  StatusRequest? statusRequest, addToFavouriteStatus;
  JobBack jobBack = new JobBack(Get.put(Crud()));
  late String language, token, id, name, image;
  Myservices myservices = Get.find();
  FavouriteBack favourite = new FavouriteBack(Get.put(Crud()));
  List<JobModel> jobs = [];

  @override
  void onInit() async {
    token = myservices.sharedPreferences.getString("token")!;
    id = myservices.sharedPreferences.getInt("id").toString();
    language = myservices.sharedPreferences.getString("lang")!;
    super.onInit();
    await getImportantJobs();
  }

  @override
  getImportantJobs()async {
    statusRequest = StatusRequest.loading;
    var response =
        await jobBack.getData(token, AppLinks.importantJob + "?lang=" + language);
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

  @override
  addRemoveFavourite(int id, int index) async {
    addToFavouriteStatus = StatusRequest.loading;
    var response;
    if (!jobs[index].isFavorite!)
      response = await favourite
          .addTaskAndJobsToFavourite(token, false, {"job_detail_id": id.toString()});
    else
      response = await favourite.removeTaskAndJobsFromFavourite(
        token,
        id.toString(),
        false,
      );
    addToFavouriteStatus = handelingData(response);
    if (StatusRequest.success == addToFavouriteStatus) {
      if (response['status'] == "success") {
        jobs[index].isFavorite = !jobs[index].isFavorite!;
      }
    }
    update();
  }
}
