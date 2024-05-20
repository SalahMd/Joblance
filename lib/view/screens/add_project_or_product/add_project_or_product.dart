import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_project_or_product_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/add_project_or_product/add_image.dart';
import 'package:joblance/view/screens/add_project_or_product/project_or_products_textfileds.dart';
import '../../../core/constants/buttons.dart';

class AddProjectOrProduct extends StatelessWidget {
  AddProjectOrProduct({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddProjectOrProductImpl(context: context));
    return GetBuilder<AddProjectOrProductImpl>(
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SafeArea(
                  child: Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back)),
                    SizedBox(width: 5.w),
                    Text(
                      !controller.isProduct
                          ? "addyourproject".tr
                          : "addyourproduct".tr,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              )),
              SizedBox(height: 30.h),
              ProjectOrProductTextFileds(
                controller: controller,
              ),
              AddImage(controller: controller),
              GestureDetector(
                onTap: () {
                  controller.sendData();
                },
                child: Container(
                  width: Dimensions.screenWidth(context),
                  height: 40.h,
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
                  decoration: AppButtons.buttonDecoration,
                  child: Text(
                    "confirm".tr,
                    style: TextStyles.w50016White(context),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
