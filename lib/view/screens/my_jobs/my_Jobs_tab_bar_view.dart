import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/my_account_controller/my_account_free_lancer_controller.dart';
import 'package:joblance/controller/my_jobs_controller.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/add_project_or_product/add_project_or_product.dart';
import 'package:joblance/view/screens/my_account/freelancer/add_skill.dart';
import 'package:joblance/view/widgets/divider.dart';
import 'package:joblance/view/widgets/job_design.dart';
import 'package:joblance/view/widgets/project_design.dart';

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
            remote: "remote".tr,
            image: AppImages.googleLogo,
            isActive: false);
      });
}
