import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_task_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/add_task/task_text_fields.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddTaskControllerImpl());
    return Scaffold(
      body: GetBuilder<AddTaskControllerImpl>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SafeArea(
                  child: Row(children: [
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back)),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "addtask".tr,
                  style: Theme.of(context).textTheme.headline1,
                )
              ])),
              SizedBox(height: 20.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 45.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          AppImages.Linkedin,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "Linkedin",
                      style: TextStyles.w50015(context),
                    )
                  ],
                ),
              )
                  .animate()
                  .fade(duration: 600.ms, delay: 100.ms)
                  .slideX(begin: 0.1),
              SizedBox(
                height: 25.h,
              ),
              TaskTextFields(controller: controller),
              GestureDetector(
                onTap: () {
                  paymentAlert(
                      "Note:",
                      "To post your job you have to pay 10\$ using your preffered payment method",
                      context);
                },
                child: Container(
                  width: Dimensions.screenWidth(context),
                  height: 40.h,
                  margin:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
                  alignment: Alignment.center,
                  decoration: AppButtons.buttonDecoration,
                  child: Text(
                    "post".tr,
                    style: TextStyles.w50016White(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
