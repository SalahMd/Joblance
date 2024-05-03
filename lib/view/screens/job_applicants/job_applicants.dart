import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/view/screens/job_applicants/applicants_top_bar.dart';
import 'package:joblance/view/widgets/job_applicant_design.dart';

class JobApplicants extends StatelessWidget {
  const JobApplicants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
            child: JobApplicantsTobBar(),
          ),
          JobApplicantDesign(),
          JobApplicantDesign(),
          JobApplicantDesign()
        ],
      ),
    ));
  }
}
