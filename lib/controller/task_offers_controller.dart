import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/core/functions/handeling_data.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/data/remote/task_back.dart';

abstract class TaskOffersController extends GetxController {
  getOffers();
  acceptUser(int index, BuildContext context);
  getTaskStatus();
  showFilters(BuildContext contex);
}

class TaskOffersControllerImpl extends TaskOffersController {
  StatusRequest? statusRequest, acceptStatus;
  late String token, lang;
  final String id;
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  Myservices myServices = Get.find();
  List data = [];
  String status = '';

  TaskOffersControllerImpl({required this.id});
  void onInit() async {
    token = myServices.sharedPreferences.getString("token")!;
    lang = myServices.sharedPreferences.getString("lang")!;
    await getOffers();
    await getTaskStatus();
    super.onInit();
  }

  getTaskStatus() async {
    statusRequest = StatusRequest.loading;
    var response = await taskBack.getTaskStatus(token, id, lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data'].isNotEmpty)
          status = response['data'][0]['task_state_name'];
      }
    }
    update();
  }

  @override
  getOffers() async {
    statusRequest = StatusRequest.loading;
    var response = await taskBack.getOffers(token, id, lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      }
    }
    update();
  }

  @override
  acceptUser(int index, BuildContext context) async {
    acceptStatus = StatusRequest.loading;
    animationedAlert(AppAnimations.loadings, "pleasewait".tr);
    var response = await taskBack.acceptUser({
      "user_id": data[index]['user_id'].toString(),
      "task_id": data[index]['task_id'].toString(),
      "duration": data[index]['excuting_time'].toString()
    }, token);
    acceptStatus = handelingData(response);
    Get.back();
    if (StatusRequest.success == acceptStatus) {
      if (response['status'] == "success") {
        Get.back();
        snackBar("", "userhasbeenaccepted".tr, context);
      } else {
        animationedAlert(AppAnimations.wrong, "couldn'tacceptuser".tr);
      }
    } else {
      animationedAlert(AppAnimations.wrong, "couldn'tacceptuser".tr);
    }
    update();
  }
  
  @override
  showFilters(BuildContext context) {
  Get.bottomSheet(Container(
    width: Dimensions.screenWidth(context),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Theme.of(context).colorScheme.primaryContainer),
    child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 60.w,
                height: 8.h,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: LightAppColors.greyColor,
                    borderRadius: BorderRadius.circular(50)),
              ),
            )),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
          child: Text(
            "filter".tr,
            style: TextStyles.bold17(context),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
          child: Text(
            "excutingtime".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        //ChipsChoices(options:['shortest'.tr,'longest'.tr]),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
          child: Text(
            "budget".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        // ChipsChoices(options: [
        //   "highest".tr,
        //   "lowest".tr,
        // ]),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
          child: Text(
            "yearsofexperience".tr,
            style: TextStyles.w50015(context),
          ),
        ),
       // ChipsChoices(options:['highest'.tr,'lowest'.tr]),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: Dimensions.screenWidth(context),
            height: 40.h,
            margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            alignment: Alignment.center,
            decoration: AppButtons.buttonDecoration,
            child: Text(
              "confirm".tr,
              style: TextStyles.w50016White(context),
            ),
          ),
        ),
      ]),
    ),
  ));
  return Future.value(true);
  }
}
