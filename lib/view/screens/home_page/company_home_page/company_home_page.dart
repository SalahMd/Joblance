import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/company_home_page_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/view/screens/home_page/categories.dart';
import 'package:joblance/view/screens/home_page/company_home_page/shimmer_company_home_page.dart';
import 'package:joblance/view/screens/home_page/top_bar.dart';
import 'package:joblance/view/widgets/freelancer_design.dart';

class CompanyHomePage extends StatelessWidget {
  const CompanyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CompanyHomePageControllerImpl());
    return WillPopScope(
      onWillPop: exitAlert,
      child: Scaffold(
        body: GetBuilder<CompanyHomePageControllerImpl>(
          builder: (controller) => SingleChildScrollView(
            child:controller.statusRequest==StatusRequest.loading?ShimmerCompanyHomePage(): Column(
              children: [
                TopBar(
                  name: "company".tr,
                  image: AppImages.googleLogo,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 15.w, top: 10.h, bottom: 10.h),
                      child: Text(
                        "categories".tr,
                        style: TextStyles.bold20(context),
                      )),
                ).animate().fade(duration: 600.ms).slideX(begin: 0.4),
                Categories(),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 15.w, top: 10.h, bottom: 10.h),
                      child: Text(
                        "popularfreelancers".tr,
                        style: TextStyles.bold20(context),
                      )),
                ).animate().fade(duration: 600.ms).slideX(begin: 0.4),
                FreeLancerDesign(),
                FreeLancerDesign(),
                FreeLancerDesign(),
                FreeLancerDesign()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
