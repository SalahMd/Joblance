import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/company/company_home_page_back.dart';
import 'package:joblance/data/remote/favourite_back.dart';
import 'package:joblance/data/remote/search_back.dart';

class CategoryController extends GetxController {
  final String majorName;
  StatusRequest? statusRequest, addToFavouriteStatus;
  FavouriteBack favorite = new FavouriteBack(Get.put(Crud()));
  Myservices myServices = Get.find();
  SearchBack searchBack = new SearchBack(Get.put(Crud()));

  CompanyHomePageBack companyHomePageBack =
      new CompanyHomePageBack(Get.put(Crud()));
  late String token, language;
  List freelancers = [];

  CategoryController({required this.majorName});
  @override
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    language = myServices.sharedPreferences.getString("lang")!;

    getFreelancers();

    super.onInit();
  }

  getFreelancers() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchBack.search(token,  AppLinks.freelancers + "?lang=" + language+"&major="+majorName);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        freelancers.addAll(response['data']);
        print(freelancers);
      }
    }

    update();
  }

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
