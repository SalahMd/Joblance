import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/company_home_page_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/home_page/categories.dart';
import 'package:joblance/view/screens/home_page/company_home_page/shimmer_company_home_page.dart';
import 'package:joblance/view/screens/home_page/top_bar.dart';
import 'package:joblance/view/widgets/freelancer_design.dart';

class CompanyHomePage extends StatelessWidget {
  const CompanyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      // This dialog will exit your app on saying yes
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
                title: new Text('Are you sure?'),
                content: new Text('Do you want to exit an App'),
                actions: [
                  TextButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Text(
                      "yes".tr,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        // Get.back();
                      },
                      child: Text(
                        "no".tr,
                        style: const TextStyle(color: Colors.blue),
                      ))
                ]),
          )) ??
          false;
    }

    Get.put(CompanyHomePageControllerImpl());
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: GetBuilder<CompanyHomePageControllerImpl>(
          builder: (controller) => SingleChildScrollView(
            child: controller.statusRequest == StatusRequest.loading
                ? ShimmerCompanyHomePage()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        TopBar(
                          name: controller.name,
                          image: controller.image,
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 15.w,
                                  top: 10.h,
                                  bottom: 10.h,
                                  end: 15.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "categories".tr,
                                    style: TextStyles.bold17(context),
                                  ),
                                ],
                              )),
                        ).animate().fade(duration: 600.ms).slideX(begin: 0.4),
                        Categories(
                          controller: controller,
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 15.w, top: 10.h, bottom: 10.h),
                              child: Text(
                                "popularfreelancers".tr,
                                style: TextStyles.bold17(context),
                              )),
                        ).animate().fade(duration: 600.ms).slideX(begin: 0.4),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: controller.freelancers.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return FreeLancerDesign(
                                name: controller.freelancers[index]['name'],
                                bio: controller.freelancers[index]['bio'],
                                location: controller.freelancers[index]
                                    ['location'],
                                image: controller.freelancers[index]['image'],
                                major: controller.freelancers[index]['major'],
                                id: controller.freelancers[index]['user_id']);
                          },
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
