import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/search_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
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
      margin: const EdgeInsetsDirectional.only(start: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "filter".tr,
            style: TextStyles.w50015(context),
          ),
          IconButton(
              onPressed: () {
                popUp(context, controller.jobType, controller.remote,
                    controller.jobExperience, controller.majors);
              },
              icon: const Icon(
                Icons.filter_alt_outlined,
                size: 30,
              ))
        ],
      ),
    );
  }
}
