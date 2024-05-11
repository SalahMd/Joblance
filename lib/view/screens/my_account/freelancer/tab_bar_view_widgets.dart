import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/my_account_controller/my_account_free_lancer_controller.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/add_project_or_product/add_project_or_product.dart';
import 'package:joblance/view/screens/my_account/freelancer/add_skill.dart';
import 'package:joblance/view/widgets/divider.dart';
import 'package:joblance/view/widgets/project_design.dart';

class TabBarViewWidgets extends StatelessWidget {
  final MyAccountFreelancerControllerImpl controller;
  const TabBarViewWidgets({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(children: [
      about(context, controller),
      projects(context, controller),
      skills(context, controller),
      contactInfo(context, controller)
    ]);
  }
}

Widget about(
    BuildContext context, MyAccountFreelancerControllerImpl controller) {
  return SingleChildScrollView(
    child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "about".tr,
            style: TextStyles.w50015(context),
          ),
          SizedBox(height: 20.h),
          Container(
              padding: EdgeInsetsDirectional.only(bottom: 5.h, top: 10.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "bio".tr,
                      style: TextStyles.w50013(context),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      controller.data['bio'],
                      style: TextStyles.w40012grey(context),
                    ),
                  ])),
          MyDivider(
            height: 12,
          ),
          Container(
            padding: EdgeInsetsDirectional.only(bottom: 15.h, top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "studyinfo".tr,
                  style: TextStyles.w50013(context),
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Icon(Icons.work_outline),
                    SizedBox(width: 10.w),
                    Text(
                      "Engineering",
                      style: TextStyles.w50012(context),
                    ),
                  ],
                ),
                MyDivider(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(Icons.cases_outlined),
                    SizedBox(width: 10.w),
                    Text(
                      "Graduate",
                      style: TextStyles.w50012(context),
                    ),
                  ],
                ),
                MyDivider(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(Icons.work_outline),
                    SizedBox(width: 10.w),
                    Text(
                      "Engineering",
                      style: TextStyles.w50012(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
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
            child: Column(
              children: [
                Text(
                  "200 \$",
                  style: TextStyle(
                      color: LightAppColors.greenColor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text("lasttransmissions".tr)),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(8)),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "deposit".tr,
                          style: TextStyles.w50014(context),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "on".tr,
                              style: TextStyles.w50012(context),
                            ),
                            Text(
                              "2024-2-2",
                              style: TextStyles.w40011grey(context),
                            )
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "value".tr,
                              style: TextStyles.w50012(context),
                            ),
                            Text(
                              "50 \$",
                              style: TextStyle(
                                color: LightAppColors.greenColor,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                MyDivider(),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(8)),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "deposit".tr,
                          style: TextStyles.w50014(context),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "on".tr,
                              style: TextStyles.w50012(context),
                            ),
                            Text(
                              "2024-2-2",
                              style: TextStyles.w40011grey(context),
                            )
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "value".tr,
                              style: TextStyles.w50012(context),
                            ),
                            Text(
                              "80 \$",
                              style: TextStyle(
                                color: LightAppColors.greenColor,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                MyDivider(),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(8)),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "withdrow".tr,
                          style: TextStyles.w50014(context),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "on".tr,
                              style: TextStyles.w50012(context),
                            ),
                            Text(
                              "2024-2-2",
                              style: TextStyles.w40011grey(context),
                            )
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "value".tr,
                              style: TextStyles.w50012(context),
                            ),
                            Text(
                              "-50 \$",
                              style: TextStyle(
                                color: Colors.red[800],
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                MyDivider()
              ],
            ),
          )
        ])),
  );
}

Widget projects(
    BuildContext context, var controller) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Text(
            "projects".tr,
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
                Text("addproject".tr, style: TextStyles.w50015(context)),
                Icon(Icons.add)
              ],
            ),
          ),
        ),
        ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.projects.length,
            itemBuilder: (BuildContext context, int index) {
              return ProjectDesign(
                projectTitle: controller.projects[index]['project_name'],
                projectDescription: controller.projects[index]
                    ['project_description'],
                projectLink: controller.projects[index]['link'],
                project_id: controller.projects[index]['id'],
                user_id: controller.projects[index]['user_id'],
              );
            })
      ],
    ),
  );
}

Widget skills(
    BuildContext context, MyAccountFreelancerControllerImpl controller) {
  return SingleChildScrollView(
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Text(
              "skills".tr,
              style: TextStyles.w50015(context),
            ),
          ),
          SizedBox(height: 10.h),
          GestureDetector(
            onTap: () {
              Get.to(AddSkill(
                controller: controller,
              ));
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
                  Text(
                    "addskill".tr,
                    style: TextStyles.w50015(context),
                  ),
                  Icon(Icons.add)
                ],
              ),
            ),
          ),
          ListView.builder(
              padding: EdgeInsets.only(
                  top: 20.h, left: 12.w, right: 12.w, bottom: 10.h),
              shrinkWrap: true,
              itemCount: controller.userSkills.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.userSkills[index]['skill_id']
                            .toString()),
                        GestureDetector(
                            onTap: () {
                              controller.deleteSkill(index);
                            },
                            child: Icon(Icons.delete_outline))
                      ],
                    ),
                    MyDivider(
                      height: 8,
                    ),
                  ],
                );
              })
        ],
      ),
    ),
  );
}

Widget contactInfo(
    BuildContext context, MyAccountFreelancerControllerImpl controller) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
    child: Column(
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
