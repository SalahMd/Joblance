import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/search_controller.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class Filters extends StatelessWidget {
  final SearchControllerImpl controller;
  const Filters({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth(context),
      height: 40.h,
      alignment: AlignmentDirectional.centerEnd,
      margin: EdgeInsetsDirectional.only(start: 10, top: 10.h),
      child: IconButton(
          onPressed: () {
            popUp(
                context,
                [
                  {"1": 'fulltime'.tr},
                  {"2": "parttime".tr},
                  {"3": 'temporary'.tr}
                ],
                [
                  {"1": 'onsite'.tr},
                  {"2": "remote".tr},
                  {"3": 'hybrid'.tr}
                ],
                controller.jobExperience,
                controller.majors, () {
              if (controller.index == 1) {
                controller.searchJobs(true);
              } else if (controller.index == 0 && controller.role == "1") {
                controller.searchFreelancers();
              } else {
                controller.searchTasks();
              }
            }, controller.index == 0 && controller.role == "1" ? true : false);
          },
          icon: const Icon(
            Icons.filter_alt_outlined,
            size: 30,
          )),
    );
  }
}
