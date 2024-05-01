import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/widgets/divider.dart';
import 'package:joblance/view/widgets/job_design.dart';
import 'package:joblance/view/widgets/project_design.dart';

class CompanyTabBar extends StatelessWidget {
  const CompanyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      jobs(
        context,
      ),
      aboutCompany(context),
      products(context),
      contactInfo(context)
    ]);
  }
}

Widget aboutCompany(BuildContext context) {
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
          "is an American multinational corporation and technology company focusing on online advertising, search engine technology, cloud computing, computer software, quantum computing, e-commerce, consumer electronics, and artificial intelligence It has been referred to as the most powerful company in the world",
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
                  remote: "remote".tr,jobId: index,
                  image: AppImages.googleLogo,
                  isActive: false);
            }),
      ],
    ),
  );
}

Widget products(BuildContext context) {
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
