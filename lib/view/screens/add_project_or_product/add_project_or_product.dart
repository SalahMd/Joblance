import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_project_or_product_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
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
              GestureDetector(
                onTap: () {
                  controller.pickImage();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).colorScheme.primaryContainer),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "addimage".tr,
                        style: TextStyles.w50014(context),
                      ),
                      Icon(Icons.add_a_photo_outlined)
                    ],
                  ),
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.only(
                  bottom: 30.h,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: controller.images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Container(
                        width: Dimensions.screenWidth(context) / 2,
                        height: 330.h,
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 15.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(
                            File(controller.images[index].path),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        start: 20.w,
                        top: 15.h,
                        child: GestureDetector(
                          onTap: () {
                            controller.removeImage(index);
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            child: Icon(
                              Icons.highlight_remove_outlined,
                              color: Colors.red[800],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
