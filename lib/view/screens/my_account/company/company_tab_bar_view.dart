import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/add_project_or_product/add_project_or_product.dart';
import 'package:joblance/view/widgets/divider.dart';
import 'package:joblance/view/widgets/job_design.dart';
import 'package:joblance/view/widgets/project_design.dart';

class CompanyTabBarViewWidget extends StatelessWidget {
  const CompanyTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      jobs(
        context,
      ),
        tasks(
        context,
      ),
      products(
        context,
      ),

      about(context),
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
                  style: TextStyles.w50015(context),
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

Widget products(BuildContext context) {
  return SingleChildScrollView(
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
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return JobDesign(
                  jobTitle: "React developer",
                  companyName: "Google",
                  location: "United states",
                  date: "9 days ago",
                  remote: "remote".tr,
                  image: AppImages.googleLogo,
                  isActive: false);
            }),
      ],
    ),
  );
}
Widget tasks(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Text(
            "mytasks".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return JobDesign(
                  jobTitle: "React developer",
                  companyName: "Google",
                  location: "United states",
                  date: "9 days ago",
                  remote: "remote".tr,
                  image: AppImages.googleLogo,
                  isActive: false);
            }),
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
