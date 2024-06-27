import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/job_applicants_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/view/screens/job_applicants/applicants_top_bar.dart';
import 'package:joblance/view/widgets/job_applicant_design.dart';

class JobApplicants extends StatelessWidget {
  final String name, date;
  final int id;
  const JobApplicants(
      {super.key, required this.name, required this.date, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(JobApplicantsControllerImpl(jobId: id));
    return Scaffold(
        body: SingleChildScrollView(
      child: GetBuilder<JobApplicantsControllerImpl>(
        builder: (controller) => Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
              child: ApplicantsTobBar(
                name: name,
                numOfApplicants: controller.applicants.length,
                date: date,
              ),
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
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: controller.applicants.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return JobApplicantDesign(
                      name: controller.applicants[i].name!,
                      email: controller.applicants[i].email!,
                      major: controller.applicants[i].majorName!,
                      date: controller.applicants[i].createdAt!,
                      image: controller.applicants[i].image!,
                      coverLetter: controller.applicants[i].coverLetter,
                      id: controller.applicants[i].id.toString());
                })
          ],
        ),
      ),
    ));
  }
}
