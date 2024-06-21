import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/my_jobs_controller.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/view/widgets/job_design.dart';

class MyJobsTabBarView extends StatelessWidget {
  final MyJobsControllerImpl controller;
  const MyJobsTabBarView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(children: [
        savedJobs(
          context,
          controller
        ),
        applaiedJobs(context,controller)
      ]),
    );
  }
}

Widget savedJobs(BuildContext context,MyJobsControllerImpl controller) {
  return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return JobDesign(
            jobTitle: "React developer",
            companyName: "Google",
            location: "United states",
            date: "9 days ago",
            remote: "remote".tr,
            jobId: index,
            image: AppImages.googleLogo,
            companyId: 12,
            isActive: false);
      });
}

Widget applaiedJobs(BuildContext context,MyJobsControllerImpl controller) {
  return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: controller.jobs.length,
      itemBuilder: (BuildContext context, int index) {
        return JobDesign(
                                  jobTitle: controller.jobs[index].jobTitle!,
                                  companyName:
                                      controller.jobs[index].companyName!,
                                  location: controller.jobs[index].location!,
                                  date: controller.jobs[index].date!,
                                  remote: controller.jobs[index].remoteName!,
                                  image: controller.jobs[index].companyImage!,
                                  isActive: controller.jobs[index].active == 1
                                      ? true
                                      : false,
                                  companyId: controller.jobs[index].companyId!,
                                  jobId: controller.jobs[index].id!,
                                );
      });
}
