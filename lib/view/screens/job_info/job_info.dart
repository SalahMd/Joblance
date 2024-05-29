import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/job_info_controller.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/view/screens/job_info/about_company.dart';
import 'package:joblance/view/screens/job_info/about_job.dart';
import 'package:joblance/view/screens/job_info/additiona_info.dart';
import 'package:joblance/view/screens/job_info/company_info.dart';
import 'package:joblance/view/screens/job_info/requirments.dart';
import 'package:joblance/view/screens/job_info/tob_bar.dart';

class JobInfo extends StatelessWidget {
  final int id;
  const JobInfo({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(JobInfoControllerImpl(jobId: id));
    return Scaffold(
      body: GetBuilder<JobInfoControllerImpl>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              JobTobBar(isOwner: false,onTap: (){},),
              CompanyInfo(
                companyImage: Image.asset(AppImages.Linkedin),
                companyName: "Linkedin",
                numOfEmployees: "51 - 100",
                jobType: "Full time",
                jobTitle: "Flutter developer",
                jobLocation: "United states",
                remote: "Remote",
                major: "Engineering",
                roleId: controller.roleId,
                isVisible: controller.isVisible,
                onTap: () {
                  controller.buttonFunction();
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              AboutCompany(),
              AboutJob(),
              Requirements(requirements:  "dadawwa\nwdawdawda"),
              AdditionalInfo(additionalInfo: "daas dasdasdas\nfd;smfod sd\nfsklmfsdmf",)
            ],
          ),
        ),
      ),
    );
  }
}
