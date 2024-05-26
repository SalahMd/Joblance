import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/company_home_page_controller.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/category_screen.dart';

class Categories extends StatelessWidget {
  final CompanyHomePageControllerImpl controller;
  const Categories({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Dimensions.screenWidth(context),
        height: 100.h,
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.majors.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                      onTap: () {
                        Get.to(CategoryScreen(
                            id: controller.majors[index].id!,
                            name: controller.majors[index].name!));
                      },
                      child: Container(
                        width: 95.w,
                        height: 90.h,
                        margin: EdgeInsets.symmetric(horizontal: 8.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:
                                Theme.of(context).colorScheme.primaryContainer),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 30.w,
                                height: 30.h,
                                child: Image.network(
                                  AppLinks.IP +
                                      "/" +
                                      controller.majors[index].image!,
                                  color: LightAppColors.primaryColor,
                                  width: 30.w,
                                  height: 30.h,
                                ),
                              ),
                              Text(
                                controller.majors[index].name!,
                                textAlign: TextAlign.center,
                                style: TextStyles.w50012(context),
                              )
                            ]),
                      ),
                    )),
          ]),
        )).animate().fade(duration: 600.ms).slideX(begin: 0.5);
  }
}
