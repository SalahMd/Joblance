import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/all_important_jobs_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/widgets/job_design.dart';

class AllImportantJobs extends StatelessWidget {
  const AllImportantJobs({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllImportantJobsControllerImpl());
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<AllImportantJobsControllerImpl>(
          builder: (controller) =>
              controller.statusRequest == StatusRequest.loading
                  ? Container()
                  : Column(
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
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: controller.iJobs.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return JobDesign(
                              jobTitle: controller.iJobs[index].jobTitle!,
                              companyName: controller.iJobs[index].companyName!,
                              location: controller.iJobs[index].location,
                              date: controller.iJobs[index].date!,
                              remote: controller.iJobs[index].remoteName!,
                              image: controller.iJobs[index].companyImage!,
                              isActive: controller.iJobs[index].active == 1
                                  ? true
                                  : false,
                              companyId: controller.iJobs[index].companyId!,
                              jobId: controller.iJobs[index].id!,
                              isFavourite: controller.iJobs[index].isFavorite,
                              onFavouriteTap: () {
                                controller.addRemoveFavourite(
                                    controller.iJobs[index].id!, index);
                              },
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
