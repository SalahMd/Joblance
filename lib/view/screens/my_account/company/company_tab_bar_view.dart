import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/my_account_controller/my_account_company_controller.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/add_project_or_product/add_project_or_product.dart';
import 'package:joblance/view/widgets/divider.dart';
import 'package:joblance/view/widgets/job_design.dart';
import 'package:joblance/view/widgets/project_design.dart';
import 'package:joblance/view/widgets/review_design.dart';
import 'package:joblance/view/widgets/task_design.dart';

class CompanyTabBarViewWidget extends StatelessWidget {
  final MyAccountCompanyControllerImpl controller;
  const CompanyTabBarViewWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2));
        controller.refreshPage();
      },
      child: TabBarView(children: [
        jobs(context, controller),
        tasks(context, controller),
        products(context, controller),
        about(context, controller),
        contactInfo(context, controller)
      ]),
    );
  }
}

Widget about(BuildContext context, MyAccountCompanyControllerImpl controller) {
  return ListView(
    padding: EdgeInsets.zero,
    children: [
      Padding(
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
            Text(
              controller.data['description'],
              style: TextStyles.w40012grey(context),
            ).animate().fade(duration: 700.ms).slideY(begin: 0.1),
            SizedBox(height: 10.h),
            MyDivider(
              height: 10,
            ),
            Text("reviews".tr, style: TextStyles.w50015(context)),
            SizedBox(height: 20.h),
            ListView.builder(
                itemCount: controller.reviews.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ReviewDesign(
                    image: controller.reviews[index].image!,
                    review: controller.reviews[index].comment!,
                    name: controller.reviews[index].firstName! +
                        " " +
                        controller.reviews[index].lastName!,
                    level: controller.reviews[index].level!,
                    date: controller.reviews[index].createdAt!,
                    userId: controller.reviews[index].userId!.toString(),
                  );
                })
          ],
        ),
      ),
    ],
  );
}

Widget products(
    BuildContext context, MyAccountCompanyControllerImpl controller) {
  return RefreshIndicator(
    onRefresh: () async {
      await Future.delayed(Duration(seconds: 2));
      controller.refreshPage();
    },
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Text(
              "products".tr,
              style: TextStyles.w50015(context),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {
              Get.to(AddProjectOrProduct());
            },
            child: Container(
              width: Dimensions.screenWidth(context),
              height: 55.h,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("addproduct".tr, style: TextStyles.w50015(context)),
                  Icon(Icons.add)
                ],
              ),
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
      ),
    ),
  );
}

Widget jobs(BuildContext context, MyAccountCompanyControllerImpl controller) {
  return RefreshIndicator(
    onRefresh: () async {
      await Future.delayed(Duration(seconds: 2));
      controller.refreshPage();
    },
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            child: Text(
              "myjobs".tr,
              style: TextStyles.w50015(context),
            ),
          ),
          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
              }),
        ],
      ),
    ),
  );
}

Widget tasks(BuildContext context, var controller) {
  return RefreshIndicator(
    onRefresh: () async {
      await Future.delayed(Duration(seconds: 2));
      controller.refreshPage();
    },
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            child: Text(
              "mytasks".tr,
              style: TextStyles.w50015(context),
            ),
          ),
          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return TaskDesign(
                    taskTitle: "Application developer",
                    userName: "Google",
                    major: "software developer",
                    date: "12-5-2024",
                    duration: "1 month",
                    image: AppImages.google,
                    isActive: true, aboutTask: '',);
              }),
        ],
      ),
    ),
  );
}

Widget contactInfo(
    BuildContext context, MyAccountCompanyControllerImpl controller) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "contactinfo".tr,
          style: TextStyles.w50017(context),
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
              controller.data['phone_number'],
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
              controller.data['email'],
              style: TextStyles.w50013(context),
            ),
          ),
        ]),
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
              controller.data['location'],
              style: TextStyles.w50013(context),
            ),
          ),
        ]),
        MyDivider(
          height: 10,
        ),
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
  );
}
