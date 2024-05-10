import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/add_project_or_product_back.dart';

abstract class ProjectScreenController extends GetxController {
  pickImage();
  removeImage(int index);
  sendData();
}

class ProjectScreenControllerImpl extends ProjectScreenController {
  final int id, projectId;
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController link;
  bool isProduct = true;
  StatusRequest? statusRequest;
  late String role, token;
  List<Map> images = [];
  AddProjectOrProductBack addProjectOrProductBack =
      new AddProjectOrProductBack(Get.put(Crud()));
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late int userId;
  bool isEditing = false, isOwner = false;
  Myservices myServices = Get.find();

  ProjectScreenControllerImpl({required this.projectId, required this.id});

  void onInit() {
    statusRequest = StatusRequest.loading;
    update();
    title = new TextEditingController();
    link = new TextEditingController();
    description = new TextEditingController();

    role = myServices.sharedPreferences.getString("role_id")!;
    token = myServices.sharedPreferences.getString("token")!;
    userId = myServices.sharedPreferences.getInt("id")!;
    if (userId == id) {
      isOwner == true;
    }
    if (role == "1") {
      isProduct = true;
    } else {
      isProduct = false;
    }
    statusRequest = StatusRequest.success;
    update();
    //getData();
    super.onInit();
  }

  void dispose() {
    title.dispose();
    description.dispose();
    link.dispose();
    super.dispose();
  }

  @override
  Future<void> pickImage() async {
    if (images.length >= 6) {
      animationedAlert(AppAnimations.wrong, "cantaddmorethan6images".tr);
      return;
    }
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      print(pickedImage.path);
      images.add({"device": File(pickedImage.path)});
    } else {}

    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await addProjectOrProductBack.getData({}, AppLinks.project, token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        title.text = response['project_name'];
        description.text = response['project_description'];
        link.text = response['link'];
        for (int i = 0; i < response['data']['images'].length; i++) {
          images.add({"network": response['data']['images'][i]});
        }
      }
    } else {
      animationedAlert(AppAnimations.wrong, "couldn'tloadinfo".tr);
    }
    update();
  }

  deleteData() async {
    // statusRequest = StatusRequest.loading;
    Get.back();
    var response = await addProjectOrProductBack.deleteData({}, token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.back();
      } else {
        animationedAlert(AppAnimations.wrong, "couldn'tdelete".tr);
      }
    }
  }

  sendData() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "pleasewait".tr);

      var response = await addProjectOrProductBack.postData({
        "project_name": title.text,
        "project_description": description.text,
        "link": link.text,
      }, images, token);
      statusRequest = handelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();
          Get.back();
        } else {
          animationedAlert(AppAnimations.wrong, "errorwhilesavingdata".tr);
        }
      } else {
        animationedAlert(AppAnimations.wrong, "errorwhilesavingdata".tr);
      }
    }
  }

  @override
  removeImage(int index) {
    images.removeAt(index);
    update();
  }
}
