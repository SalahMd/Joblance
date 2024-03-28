import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_project_or_product_controller.dart';
import 'package:joblance/view/screens/add_project_or_product/add_image.dart';
import 'package:joblance/view/screens/add_project_or_product/project_or_products_textfileds.dart';

class AddProjectOrProduct extends StatelessWidget {
  AddProjectOrProduct({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddProjectOrProductImpl());
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
                    Icon(Icons.arrow_back),
                    SizedBox(width: 5.w),
                    Text(
                      !controller.isProduct ? "addyourproject".tr : "addyourproduct".tr,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              )),
              SizedBox(height: 30.h),
              ProjectOrProductTextFileds(
                controller: controller,
              ),
              AddImage(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}
