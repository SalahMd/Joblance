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
        ),
        applaiedJobs(context)
      ]),
    );
  }
}

Widget savedJobs(BuildContext context) {
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
            isActive: false);
      });
}

Widget applaiedJobs(BuildContext context) {
  return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return JobDesign(
            jobTitle: "React developer",
            companyName: "Google",
            location: "United states",
            date: "9 days ago",
            jobId: index,
            remote: "remote".tr,
            image: AppImages.googleLogo,
            isActive: false);
      });
}
