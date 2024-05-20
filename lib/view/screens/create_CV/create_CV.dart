import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/create_CV_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/create_CV/CV_birth_of_date.dart';
import 'package:joblance/view/screens/create_CV/CV_textfields.dart';

class CreateCV extends StatelessWidget {
  const CreateCV({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateCVControllerImpl());
    return Scaffold(
      body: GetBuilder<CreateCVControllerImpl>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SafeArea(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 18.sp,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "createyourcv".tr,
                      style: TextStyles.w50019(context),
                    ),
                  ],
                ),
              )),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  "pleasefillthefields".tr,
                  style: TextStyles.w40013grey(context),
                ),
              ),
              CVTextFields(controller: controller),
              CVBirthDate(controller: controller),
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: Dimensions.screenWidth(context),
                  height: 40.h,
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
                  decoration: AppButtons.buttonDecoration,
                  child: Text(
                    "generatecv".tr,
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
