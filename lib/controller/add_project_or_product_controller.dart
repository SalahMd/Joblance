import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/services/services.dart';

abstract class AddProjectOrProductController extends GetxController {
  pickImage();
  removeImage(int index);
}

class AddProjectOrProductImpl extends AddProjectOrProductController {
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController link;
  bool isProduct = true;
  String role = "2";
  List images = [];
  Myservices myServices = Get.find();

  void onInit() {
    title = new TextEditingController();
    link = new TextEditingController();
    description = new TextEditingController();
    //role = myServices.sharedPreferences.getString("role_id")!;
    if (role == "2") {
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
    } else {
    }

    update();
  }

  @override
  removeImage(int index) {
    images.removeAt(index);
    update();
  }
}
