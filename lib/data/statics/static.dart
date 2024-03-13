import 'package:get/get.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/data/model/categorie_model.dart';
import 'package:joblance/data/model/on_boarding_model.dart';

List<OnBoardingModel> Onbordingmodel = [
  OnBoardingModel(
      title: "title1".tr, animation: AppImages.onBoarding1, body: "body1".tr),
  OnBoardingModel(
      title: "title2".tr, animation: AppImages.onBoarding2, body: "body2".tr),
  OnBoardingModel(
      title: "title3".tr, animation: AppImages.onBoarding3, body: "body3".tr),
  OnBoardingModel(
      title: "title4".tr, animation: AppImages.onBoarding4, body: "body4".tr),
];
List<CategoryModel> categories = [
  CategoryModel(name: "Engineering", image: AppImages.cat3),
  CategoryModel(name: "Technology", image: AppImages.cat5),
  CategoryModel(name: "Medical", image: AppImages.cat4),
  CategoryModel(name: "Designing", image: AppImages.cat2),
  CategoryModel(name: "Servicing", image: AppImages.cat6)
];
