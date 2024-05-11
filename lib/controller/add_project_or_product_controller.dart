import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/add_project_or_product_back.dart';

abstract class AddProjectOrProductController extends GetxController {
  pickImage();
  removeImage(int index);
  sendData();
}

class AddProjectOrProductImpl extends AddProjectOrProductController {
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController link;
  bool isProduct = true;
  StatusRequest? statusRequest;
  late String role, token;
  List images = [];
  AddProjectOrProductBack addProjectOrProductBack =
      new AddProjectOrProductBack(Get.put(Crud()));
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  Myservices myServices = Get.find();

  void onInit() {
    title = new TextEditingController();
    link = new TextEditingController();
    description = new TextEditingController();
    role = myServices.sharedPreferences.getString("role_id")!;
    token = myServices.sharedPreferences.getString("token")!;
    if (role == "1") {
      isProduct = true;
    } else {
      isProduct = false;
    }
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
      images.add(File(pickedImage.path));
    } else {}

    update();
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
          Get.back();
          animationedAlert(AppAnimations.wrong, "errorwhilesavingdata".tr);
        }
      } else {
        Get.back();
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
