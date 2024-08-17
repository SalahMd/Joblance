import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/all_tasks.dart';
import 'package:joblance/controller/freelancer_home_page_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/view/screens/all_important_jobs.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/shimmer_freelancer_home_page.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/swiper.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/tasks.dart';
import 'package:joblance/view/screens/home_page/top_bar.dart';
import 'package:joblance/view/screens/status_screen.dart';
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
          builder: (controller) => RefreshIndicator(
            onRefresh: () async {
              controller.refreshPage();
            },
            child: SingleChildScrollView(
              child: controller.statusRequest == StatusRequest.loading
                  ? ShimmerFreelancerHomePage()
                  : controller.statusRequest == StatusRequest.success
                      ? Column(
                          children: [
                            TopBar(
                              name: controller.name,
                              image: controller.image,
                            ),
                            Visibility(
                              visible: controller.importantJobs.isNotEmpty,
                              child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Padding(
                                    padding: EdgeInsetsDirectional.only(
                                      start: 15.w,
                                      top: 15.h,
                                      end: 15.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "popularjobs".tr,
                                          style: TextStyles.bold17(context),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(AllImportantJobs());
                                          },
                                          child: Text(
                                            "showall".tr,
                                            style: TextStyle(
                                                color:
                                                    LightAppColors.primaryColor,
                                                fontSize: 12.sp),
                                          ),
                                        ),
                                      ],
                                    )),
                              )
                                  .animate()
                                  .fade(duration: 600.ms)
                                  .slideX(begin: 0.4),
                            ),
                            controller.importantJobs.isNotEmpty
                                ? Swiper(
                                    controller: controller,
                                  )
                                    .animate()
                                    .fade(duration: 600.ms)
                                    .scaleXY(begin: 0.8)
                                : Container(),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    start: 15.w,
                                    end: 15.w,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "tasks".tr,
                                        style: TextStyles.bold17(context),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(AllTasks());
                                        },
                                        child: Text(
                                          "showall".tr,
                                          style: TextStyle(
                                              color:
                                                  LightAppColors.primaryColor,
                                              fontSize: 12.sp),
                                        ),
                                      ),
                                    ],
                                  )),
                            )
                                .animate()
                                .fade(duration: 600.ms)
                                .slideX(begin: 0.4),
                            Tasks(
                              controller: controller,
                            )
                                .animate()
                                .fade(duration: 600.ms)
                                .slideX(begin: 0.4),
                            // Categories()
                            //  ,
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 15.w, top: 5.h, bottom: 5.h),
                                  child: Text(
                                    "recentjobs".tr,
                                    style: TextStyles.bold17(context),
                                  )),
                            )
                                .animate()
                                .fade(duration: 600.ms)
                                .slideX(begin: 0.4),
                            ListView.builder(
                              itemCount: controller.jobs.length,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return JobDesign(
                                  jobTitle: controller.jobs[index].jobTitle!,
                                  companyName:
                                      controller.jobs[index].companyName!,
                                  location: controller.jobs[index].location,
                                  date: controller.jobs[index].date!,
                                  remote: controller.jobs[index].remoteName!,
                                  image: controller.jobs[index].companyImage!,
                                  isActive: controller.jobs[index].active == 1
                                      ? true
                                      : false,
                                  companyId: controller.jobs[index].companyId!,
                                  jobId: controller.jobs[index].id!,
                                  isFavourite:
                                      controller.jobs[index].isFavorite,
                                  onFavouriteTap: () {
                                    controller.addRemoveFavourite(
                                        controller.jobs[index].id!,
                                        false,
                                        index);
                                  },
                                );
                              },
                            )
                          ],
                        )
                      : StatusScreen(statusRequest: controller.statusRequest),
            ),
          ),
        ),
      ),
    );
  }
}
