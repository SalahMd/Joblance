import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/model/project_or_product_model.dart';
import 'package:joblance/data/model/review_model.dart';
import 'package:joblance/data/remote/add_project_or_product_back.dart';
import 'package:joblance/data/remote/add_review_back.dart';
import 'package:joblance/data/remote/company/company_profile.dart';

abstract class MyAccountCompanyController extends GetxController {
  getUserData();
  getProduts();
  getReviews();
}

class MyAccountCompanyControllerImpl extends MyAccountCompanyController {
  StatusRequest? statusRequest;
  AddProjectOrProductBack addProjectOrProductBack =
      AddProjectOrProductBack(Get.put(Crud()));
  CompanyAccount companyAccount = new CompanyAccount(Get.put(Crud()));
  AddReviewBack addReviewBack = new AddReviewBack(Get.put(Crud()));
  Myservices myServices = Get.find();
  Map data = {};
  List <ReviewModel>reviews = [];
  List<ProjectOrProductModel> products = [];
  late String token, id, lang;
  List<Widget> tabs = [
    Tab(
      text: "jobs".tr,
    ),
    Tab(
      text: "tasks".tr,
    ),
    Tab(text: "products".tr),
    Tab(
      text: "about".tr,
    ),
    Tab(text: "contact".tr),
  ];
  @override
  void onInit() async {
    lang = myServices.sharedPreferences.getString("lang")!;
    token = myServices.sharedPreferences.getString("token")!;
    id = myServices.sharedPreferences.getInt("id")!.toString();
    await getUserData();
    await getProduts();
    await getReviews();
    super.onInit();
  }

  Future<void> refreshPage() async {
    statusRequest = StatusRequest.loading;
    update();
    products.clear();
    data.clear();
    reviews.clear();
    update();
    await getUserData();
    await getProduts();
    await getReviews();
  }

  getReviews() async {
    statusRequest = StatusRequest.loading;
    var response = await addReviewBack.getData({}, token, id.toString());
    statusRequest = handelingData(response);
    if (response['status'] == "success") {
      for (var reviewData in response['data']) {
        reviews.add(ReviewModel.fromJson(reviewData));
      }
    }
    update();
  }

  getUserData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await companyAccount.getData(token, id, lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      }
    }
    update();
  }

  getProduts() async {
    var response =
        await addProjectOrProductBack.getData({}, AppLinks.project, token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (int i = 0; i < response['data'].length; i++) {
          products.add(ProjectOrProductModel(
              id: response['data'][i]['id'],
              projectName: response['data'][i]['project_name'],
              projectDescription: response['data'][i]['project_description'],
              link: response['data'][i]['link'],
              userId: response['data'][i]['user_id']));
        }
      }
    }
    update();
  }

  void dispose() {
    super.dispose();
  }
}
