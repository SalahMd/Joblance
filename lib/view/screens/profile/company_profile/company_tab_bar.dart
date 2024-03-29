import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/divider.dart';
import 'package:joblance/view/widgets/job_design.dart';

class CompanyTabBar extends StatelessWidget {
  const CompanyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenHeight(context),
      //width: Dimensions.screenWidth(context),
      child: TabBarView(children: [
        Column(
          children: [
            Expanded(
              child: jobs(
                context,
              ),
            ),
          ],
        ),
        aboutCompany(context),
        products(context),
        contactInfo(context)
      ]),
    );
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
          style: Theme.of(context).textTheme.headline1,
        ).animate().fade(duration: 600.ms).slideY(begin: 0.9),
        SizedBox(
          height: 20.h,
        ),
        Expanded(
            child: Text(
          "is an American multinational corporation and technology company focusing on online advertising, search engine technology, cloud computing, computer software, quantum computing, e-commerce, consumer electronics, and artificial intelligence It has been referred to as the most powerful company in the world",
          style: TextStyles.w40014grey(context),
        )).animate().fade(duration: 700.ms).slideY(begin: 0.1)
      ],
    ),
  );
}

Widget jobs(BuildContext context) {
  return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 12,
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

Widget products(BuildContext context) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "companyproducts".tr,
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      )).animate().fade(duration: 600.ms).slideY(begin: 0.1);
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
          style: Theme.of(context).textTheme.headline1,
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
