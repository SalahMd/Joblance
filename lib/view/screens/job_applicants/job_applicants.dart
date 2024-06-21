import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
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
            child: ApplicantsTobBar(name: "Flutter",),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 15.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "filter".tr,
                  style: TextStyles.w50013(context),
                ),
                GestureDetector(
                  onTap: () {
                    applicantsFilter(context);
                  },
                  child: Icon(
                    Icons.filter_alt_outlined,
                    size: 20.sp,
                  ),
                )
              ],
            ),
          ),
          JobApplicantDesign(),
          JobApplicantDesign(),
          JobApplicantDesign()
        ],
      ),
    ));
  }
}
