import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/profiles_controller/company_profile_controller.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/my_account/company/company_tab_bar_view.dart';
import 'package:joblance/view/widgets/divider.dart';
import 'package:joblance/view/widgets/job_design.dart';
import 'package:joblance/view/widgets/project_design.dart';

class CompanyTabBar extends StatelessWidget {
  final CompanyProfileControllerImpl controller;
  const CompanyTabBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      jobs(
        context,
      ),
      tasks(context,controller),
      aboutCompany(context, controller),
      products(context,controller),
      contactInfo(context)
    ]);
  }
}

Widget aboutCompany(
    BuildContext context, CompanyProfileControllerImpl controller) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "aboutcompany".tr,
          style: TextStyles.w50015(context),
        ).animate().fade(duration: 600.ms).slideY(begin: 0.9),
        SizedBox(
          height: 20.h,
        ),
        Expanded(
            child: Text(
          controller.data['description'],
          style: TextStyles.w40012grey(context),
        )).animate().fade(duration: 700.ms).slideY(begin: 0.1)
      ],
    ),
  );
}

Widget jobs(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Text(
            "myjobs".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
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
            }),
      ],
    ),
  );
}

Widget products(BuildContext context,CompanyProfileControllerImpl controller) {
  return SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: Text(
            "companyproducts".tr,
            style: TextStyles.w50015(context),
          ),
        ),
         ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.products.length,
              itemBuilder: (BuildContext context, int index) {
                return ProjectDesign(
                  projectTitle: controller.products[index].projectName!,
                  projectDescription:
                      controller.products[index].projectDescription!,
                  projectLink: controller.products[index].link!,
                  project_id: controller.products[index].id!,
                  user_id: controller.products[index].userId!,
                );
              })
      ],
    ).animate().fade(duration: 600.ms).slideY(begin: 0.1),
  );
}

Widget contactInfo(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "contactinfo".tr,
          style: TextStyles.w50015(context),
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            Icon(Icons.call_outlined),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "+963996541809",
              style: TextStyles.w50013(context),
            )
          ],
        ),
        MyDivider(
          height: 10,
        ),
        Row(children: [
          Icon(Icons.mail_outlined),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              "salahaldeenmdaghmesh@gmail.com",
              style: TextStyles.w50013(context),
            ),
          ),
        ]),
        MyDivider(
          height: 10,
        ),
        MyDivider(
          height: 10,
        ),
        Row(children: [
          Icon(Icons.location_on_outlined),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              "Syria",
              style: TextStyles.w50013(context),
            ),
          ),
        ]),
        Row(children: [
          Icon(Icons.link_outlined),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              "www.google.com",
              style: TextStyles.w50013(context),
            ),
          )
        ])
      ],
    ),
  ).animate().fade(duration: 600.ms).slideY(begin: 0.1);
}
