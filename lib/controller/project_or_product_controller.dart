import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/add_project_or_product_back.dart';

abstract class ProjectScreenController extends GetxController {
  pickImage();
  removeImage(int index, int id);
  getData();
  updateProject();
}

class ProjectScreenControllerImpl extends ProjectScreenController {
  final int id, projectId;
  final BuildContext context;
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController link;
  bool isProduct = true;
  StatusRequest? statusRequest, updateStatus;
  late String role, token;
  List<Map> images = [];

  List deletedImages = [], imagesId = [];
  AddProjectOrProductBack addProjectOrProductBack =
      new AddProjectOrProductBack(Get.put(Crud()));
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late int userId;
  bool isEditing = false, isOwner = false;
  Myservices myServices = Get.find();
  List newImages = [];
  ProjectScreenControllerImpl(this.context,
      {required this.projectId, required this.id});

  void onInit() {
    statusRequest = StatusRequest.loading;
    update();
    title = TextEditingController();
    link = TextEditingController();
    description = TextEditingController();

    role = myServices.sharedPreferences.getString("role_id")!;
    token = myServices.sharedPreferences.getString("token")!;
    userId = myServices.sharedPreferences.getInt("id")!;
    if (userId == id) {
      isOwner = true;
    }
    if (role == "1") {
      isProduct = true;
    } else {
      isProduct = false;
    }
    getData();
    super.onInit();
  }

  updateProject() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      updateStatus = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "pleasewait".tr);
      Map data = {
        "project_name": title.text,
        "project_description": description.text,
        "link": link.text,
      };
      for (int i = 0; i < deletedImages.length; i++) {
        data["images_del[$i]"] = deletedImages[i];
      }
      for (int i = 0; i < images.length; i++) {
        if (images[i].containsKey("device")) {
          newImages.add(images[i]["device"]);
        }
        print(deletedImages);
        print(images);
      }

      var response = await addProjectOrProductBack.updateData(
          data, token, projectId.toString(), newImages);
      updateStatus = handelingData(response);
      Get.back();
      if (StatusRequest.success == updateStatus) {
        if (response['status'] == "success") {
          Get.back();
          if (role == "1") {
            snackBar("", "yourproducthasbeensaved".tr, context);
          } else {
            snackBar("", "yourprojecthasbeensaved".tr, context);
          }
        } else {
          Get.back();
          animationedAlert(AppAnimations.wrong, "e".tr);
        }
      } else {
        Get.back();
        animationedAlert(AppAnimations.wrong, "errorwhilesavingdata".tr);
      }
    }
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
    var response = await addProjectOrProductBack
        .getData({}, AppLinks.project + "/" + projectId.toString(), token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        title.text = response['data']['project']['project_name'];
        description.text = response['data']['project']['project_description'];
        link.text = response['data']['project']['link'];
        for (int i = 0; i < response['data']['images'].length; i++) {
          imagesId.add(response['data']['images'][i]['id']);
          images.add({"network": response['data']['images'][i]['image_path']});
        }
      }
    } else {
      Get.back();
      animationedAlert(AppAnimations.wrong, "couldn'tloadinfo".tr);
    }
    update();
  }

  deleteData() async {
    Get.back();
    var response =
        await addProjectOrProductBack.deleteData(projectId.toString(), token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.back();
      } else {
        animationedAlert(AppAnimations.wrong, "couldn'tdelete".tr);
      }
    }else{
      animationedAlert(AppAnimations.wrong, "couldn'tdelete".tr);
    }
  }

  @override
  removeImage(int index, int? id) {
    if (id != null) deletedImages.add(id);
    images.removeAt(index);
    print(deletedImages);
    update();
  }
}
