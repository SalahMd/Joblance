import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/categorie_model.dart';
import 'package:joblance/data/remote/company/company_home_page_back.dart';
import 'package:joblance/data/remote/favourite_back.dart';

abstract class CompanyHomePageController extends GetxController {
  getCompanyInfo();
  getMajors();
  addToFavourite(int id, int index);
  getFreelancers();
}

class CompanyHomePageControllerImpl extends CompanyHomePageController {
  StatusRequest? statusRequest, majorStatus, addToFavouriteStatus;
  Myservices myServices = Get.find();
  late String token, language, id;
  String name = "", image = "";
  List<CategoryModel> majors = [];
  List freelancers = [];
  FavouriteBack favorite = new FavouriteBack(Get.put(Crud()));
  CompanyHomePageBack companyHomePageBack =
      new CompanyHomePageBack(Get.put(Crud()));

  @override
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    id = myServices.sharedPreferences.getInt("id")!.toString();
    language = myServices.sharedPreferences.getString("lang") == null
        ? "en"
        : myServices.sharedPreferences.getString("lang")!;
    getFreelancers();
    getMajors();
    getCompanyInfo();

    super.onInit();
  }

  getCompanyInfo() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await companyHomePageBack.getCompanyInfo(token, language, id);
    statusRequest = handelingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        name = response['data']['name'];
        image = response['data']['image'];
      }
    }
    print("ww1");
    update();
  }

  getMajors() async {
    majorStatus = StatusRequest.loading;
    var response = await companyHomePageBack.getMajor(token, language);
    majorStatus = handelingData(response);
    if (StatusRequest.success == majorStatus) {
      if (response['status'] == "success") {
        for (int i = 0; i < response['data'].length; i++) {
          majors.add(CategoryModel(
              id: response['data'][i]['id'],
              name: response['data'][i]['name'],
              image: response['data'][i]['image']));
        }
      }
    }
    update();
  }

  refreshPage() async {
    majors.clear();
    freelancers.clear();
    language = myServices.sharedPreferences.getString("lang") == null
        ? "en"
        : myServices.sharedPreferences.getString("lang")!;
    await getCompanyInfo();
    await getFreelancers();
    await getMajors();
  }

  getFreelancers() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await companyHomePageBack.getFreeLancers(token, language);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        freelancers.addAll(response['data']['data']);
        print(freelancers);
      }
    }

    update();
  }

  @override
  addToFavourite(int id, int index) async {
    addToFavouriteStatus = StatusRequest.loading;
    var response;
    if (!freelancers[index]['favourited'])
      response = await favorite.addFreelancerToFavorite(token, id.toString());
    else
      response =
          await favorite.removeFreelancerFromFavourite(token, id.toString());
    addToFavouriteStatus = handelingData(response);
    if (StatusRequest.success == addToFavouriteStatus) {
      if (response['status'] == "success") {
        freelancers[index]['favourited'] = !freelancers[index]['favourited'];
      }
    }
    update();
  }
}
