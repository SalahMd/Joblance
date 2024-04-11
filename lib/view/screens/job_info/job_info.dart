import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/view/screens/job_info/about_company.dart';
import 'package:joblance/view/screens/job_info/about_job.dart';
import 'package:joblance/view/screens/job_info/additiona_info.dart';
import 'package:joblance/view/screens/job_info/company_info.dart';
import 'package:joblance/view/screens/job_info/requirments.dart';
import 'package:joblance/view/screens/job_info/tob_bar.dart';

class JobInfo extends StatelessWidget {
  const JobInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            JobTobBar(),
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
            SizedBox(
              height: 5.h,
            ),
            AboutCompany(),
            AboutJob(),
            Requirements(),
            AdditionalInfo()
          ],
        ),
      ),
    );
  }
}
