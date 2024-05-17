import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/profiles_controller/freelancer_profile_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/my_account/freelancer/tab_bar_view_widgets.dart';
import 'package:joblance/view/widgets/divider.dart';

class TabBarWidgets extends StatelessWidget {
  final FreelancerProfileControllerImpl controller;
  const TabBarWidgets({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
      about(context, controller),
      projects(context, controller),
      skills(context, controller),
      contactInfo(context, controller)
    ]);
  }
}

Widget about(context, FreelancerProfileControllerImpl controller) {
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
                      controller.data['major'],
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
                      controller.data['study_case'],
                      style: TextStyles.w50012(context),
                    ),
                  ],
                ),
              ],
            ),
          )
        ])),
  );
}

Widget skills(context, FreelancerProfileControllerImpl controller) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "skills".tr,
          style: TextStyles.w50015(context),
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
                      Text(controller.userSkills[index]['skill_name']
                          .toString()),
                      MyDivider(
                        height: 8,
                      ),
                    ],
                  );
                })
      ],
    ),
  );
}

Widget contactInfo(context, controller) {
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
