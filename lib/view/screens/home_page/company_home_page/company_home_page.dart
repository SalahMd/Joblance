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
import 'package:joblance/view/screens/status_screen.dart';
import 'package:joblance/view/widgets/freelancer_design.dart';

class CompanyHomePage extends StatelessWidget {
  const CompanyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CompanyHomePageControllerImpl());
    return Scaffold(
      body: GetBuilder<CompanyHomePageControllerImpl>(
        builder: (controller) => RefreshIndicator(
          onRefresh: () async {
            controller.refreshPage();
          },
          child: SingleChildScrollView(
            child: controller.statusRequest == StatusRequest.loading
                ? ShimmerCompanyHomePage()
                : controller.statusRequest == StatusRequest.success
                    ? Column(
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
                                name: controller.freelancers[index]
                                        ['first_name'] +
                                    " " +
                                    controller.freelancers[index]['last_name'],
                                bio: controller.freelancers[index]['bio'],
                                location: controller.freelancers[index]
                                    ['location'],
                                image: controller.freelancers[index]['image'],
                                major: controller.freelancers[index]['major'],
                                openToWork: controller.freelancers[index]
                                    ['open_to_work'],
                                id: controller.freelancers[index]['id'],
                                rateLevel: controller.freelancers[index]
                                    ['rate'],
                                numOfRates: controller.freelancers[index]
                                    ['counter'],
                              );
                            },
                          ),
                        ],
                      )
                    : StatusScreen(statusRequest: controller.statusRequest),
          ),
        ),
      ),
    );
  }
}
