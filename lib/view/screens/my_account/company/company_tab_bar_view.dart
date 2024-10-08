import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/my_account_controller/my_account_company_controller.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/add_project_or_product/add_project_or_product.dart';
import 'package:joblance/view/widgets/divider.dart';
import 'package:joblance/view/widgets/job_design.dart';
import 'package:joblance/view/widgets/project_design.dart';
import 'package:joblance/view/widgets/review_design.dart';
import 'package:joblance/view/widgets/task_design.dart';
import 'package:joblance/view/widgets/transaction_widget.dart';

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
        await Future.delayed(Duration(seconds: 1));
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
              itemCount: controller.jobs.length,
              itemBuilder: (BuildContext context, int index) {
                return JobDesign(
                  jobTitle: controller.jobs[index].jobTitle!,
                  companyName: controller.jobs[index].companyName!,
                  location: controller.jobs[index].location!,
                  date: controller.jobs[index].date!,
                  remote: controller.jobs[index].remoteName!,
                  image: controller.jobs[index].companyImage!,
                  isActive: controller.jobs[index].active == 1 ? true : false,
                  companyId: controller.jobs[index].companyId!,
                  jobId: controller.jobs[index].id!,
                  onFavouriteTap: () {
                    controller.addRemoveFavourite(
                        controller.jobs[index].id!, false);
                  },
                );
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
              itemCount: controller.tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return TaskDesign(
                  taskTitle: controller.tasks[index].taskTitle,
                  userName: controller.tasks[index].name,
                  major: controller.tasks[index].majorName,
                  date: controller.tasks[index].createdAt,
                  duration: controller.tasks[index].taskDuration.toString(),
                  image: controller.tasks[index].image,
                  isActive: controller.tasks[index].active == 1 ? true : false,
                  aboutTask: controller.tasks[index].aboutTask,
                  taskId: controller.tasks[index].id,
                  id: controller.tasks[index].userId,
                );
              }),
        ],
      ),
    ),
  );
}

Widget contactInfo(
    BuildContext context, MyAccountCompanyControllerImpl controller) {
  return ListView(
    padding: EdgeInsets.zero,
    children: [
      Padding(
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
            ]),
            SizedBox(height: 30.h),
            Text(
              "mybudget".tr,
              style: TextStyles.w50015(context),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
                //margin: EdgeInsets.symmetric(horizontal: 60.w),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.primaryContainer),
                child: Column(children: [
                  Text(
                    controller.balance.toString() + "\$",
                    style: TextStyle(
                        color: LightAppColors.greenColor,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text("lasttransactions".tr)),
                  SizedBox(height: 10.h),
                  MyDivider(),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.transactions.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return TransactionWidget(
                          date: controller.transactions[index].date!,
                          value:
                              controller.transactions[index].balance.toString(),
                          transName: controller
                              .transactions[index].transactionTypeName!,
                          transId:
                              controller.transactions[index].transactionTypeId!,
                        );
                      })
                ]))
          ],
        ),
      ),
    ],
  );
}
