import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/my_account_controller/my_account_free_lancer_controller.dart';
import 'package:joblance/core/constants/images.dart';
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
    return TabBarView(children: [
      about(context),
      projects(
        context,
      ),
      skills(context, controller),
      contactInfo(context)
    ]);
  }
}

Widget about(BuildContext context) {
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
                      "A junior flutter developer in the third year of amascus university, with 2 years of expirence in developing apps."
                          .tr,
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
          )
        ])),
  );
}

Widget projects(BuildContext context) {
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
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return ProjectDesign(
                  projectTitle: "Joblance",
                  projectDescription:
                      "Jobs and freelancing app made with flutter and laravel",
                  projectMedia: AppImages.Linkedin,
                  projectLink: "https//www.google.com");
            })
      ],
    ),
  );
}

Widget skills(BuildContext context, var controller) {
  return Container(
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
        Container(
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
              GestureDetector(
                  onTap: () {
                    Get.to(AddSkill(
                      controller: controller,
                    ));
                  },
                  child: Icon(Icons.add))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Flutter"), Icon(Icons.delete_outline)],
              ),
              MyDivider(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Office"), Icon(Icons.delete_outline)],
              ),
              MyDivider(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Problem  Solving"),
                  Icon(Icons.delete_outline)
                ],
              ),
              MyDivider(
                height: 8,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget contactInfo(BuildContext context) {
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
