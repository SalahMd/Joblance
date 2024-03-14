import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/job_info/about_company.dart';
import 'package:joblance/view/screens/job_info/about_job.dart';
import 'package:joblance/view/screens/job_info/company_info.dart';
import 'package:joblance/view/screens/job_info/requirments.dart';
import 'package:joblance/view/screens/job_info/tob_bar.dart';
import 'package:joblance/view/widgets/divider.dart';

class JobInfo extends StatelessWidget {
  const JobInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: LightAppColors.primaryColor.withOpacity(0.4),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            CompanyInfo(
              companyImage: Image.asset(AppImages.Linkedin),
              companyName: "Linkedin",
              numOfEmployees: "51 - 100",
              jobType: "Full time",
              jobTitle: "Flutter developer",
              jobLocation: "United states",
              remote: "Remote",
              major: "Engineering",
            ),
            MyDivider(),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(height: 10.h),
            AboutCompany(),
            AboutJob(),
            SizedBox(height: 10.h),
            Requirements(),
            SizedBox(height: 10.h),
            SizedBox(height: 10.h),
            Container(
              width: Dimensions.screenwidth(context),
              height: 100.h,
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              color: Theme.of(context).colorScheme.primaryContainer,
            )
          ],
        ),
      ),
    );
  }
}
