import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/all_important_jobs_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/widgets/job_design.dart';

class AllImportantJobs extends StatelessWidget {
  const AllImportantJobs({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllImportantJobsControllerImpl());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back)),
                SizedBox(width: 10.w),
                Text(
                  "allimportantjobs".tr,
                  style: TextStyles.w50019(context),
                ),
              ]),
            )),
            SizedBox(height: 10.h),
            GetBuilder<AllImportantJobsControllerImpl>(
              builder: (controller) => ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: controller.jobs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return JobDesign(
                      jobTitle: controller.jobs[index].jobTitle!,
                      companyName: controller.jobs[index].companyName!,
                      location: controller.jobs[index].location,
                      date: controller.jobs[index].date!,
                      remote: controller.jobs[index].remoteName!,
                      image: controller.jobs[index].companyImage!,
                      isActive:
                          controller.jobs[index].active == 1 ? true : false,
                      companyId: controller.jobs[index].companyId!,
                      jobId: controller.jobs[index].id!,
                      isFavourite: controller.jobs[index].isFavorite,
                      onFavouriteTap: () {
                        controller.addRemoveFavourite(
                            controller.jobs[index].id!, index);
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
