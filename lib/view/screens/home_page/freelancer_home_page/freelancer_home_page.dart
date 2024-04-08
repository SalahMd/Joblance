import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/freelancer_home_page_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/shimmer_freelancer_home_page.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/swiper.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/tasks.dart';
import 'package:joblance/view/screens/home_page/top_bar.dart';
import 'package:joblance/view/widgets/job_design.dart';

class FreelancerHomePage extends StatelessWidget {
  FreelancerHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(FreelancerHomePageControllerImpl());
    return WillPopScope(
      onWillPop: exitAlert,
      child: Scaffold(
        body: GetBuilder<FreelancerHomePageControllerImpl>(
          builder: (controller) => SingleChildScrollView(
            child: controller.statusRequest == StatusRequest.loading
                ? ShimmerFreelancerHomePage()
                : Column(
                    children: [
                      TopBar(
                        name: "freelancer".tr,
                        image: AppImages.Linkedin,
                      ),

                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 15.w, top: 10.h, bottom: 15.h),
                            child: Text(
                              "popularjobs".tr,
                              style: TextStyles.bold20(context),
                            )),
                      ).animate().fade(duration: 600.ms).slideX(begin: 0.4),
                      Swiper()
                          .animate()
                          .fade(duration: 600.ms)
                          .scaleXY(begin: 0.8),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 15.w, top: 10.h, bottom: 10.h),
                            child: Text(
                              "tasks".tr,
                              style: TextStyles.bold20(context),
                            )),
                      ).animate().fade(duration: 600.ms).slideX(begin: 0.4),
                      Tasks(),
                      // Categories()
                      //  ,
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 15.w, top: 10.h, bottom: 5.h),
                            child: Text(
                              "recentjobs".tr,
                              style: TextStyles.bold20(context),
                            )),
                      ).animate().fade(duration: 600.ms).slideX(begin: 0.4),
                      JobDesign(
                          jobTitle: "Ai developer",
                          companyName: "Google",
                          location: "Germany",
                          date: "5 days ago",
                          remote: "onsite".tr,
                          image: AppImages.googleLogo,
                          isActive: true),

                      JobDesign(
                          jobTitle: "Flutter developer",
                          companyName: "Linkedin",
                          location: "United states",
                          date: "2 days ago",
                          remote: "remote".tr,
                          image: AppImages.Linkedin,
                          isActive: true),
                      JobDesign(
                          jobTitle: "Java developer",
                          companyName: "Meta",
                          location: "United kingdom",
                          date: "2 weeks ago",
                          remote: "remote".tr,
                          image: AppImages.meta,
                          isActive: true),
                      JobDesign(
                          jobTitle: "React developer",
                          companyName: "Linkedin",
                          location: "United states",
                          date: "9 days ago",
                          remote: "remote".tr,
                          image: AppImages.Linkedin,
                          isActive: false)
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
