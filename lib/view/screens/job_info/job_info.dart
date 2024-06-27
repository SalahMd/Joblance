import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/job_info_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/view/screens/job_info/about_company.dart';
import 'package:joblance/view/screens/job_info/about_job.dart';
import 'package:joblance/view/screens/job_info/additiona_info.dart';
import 'package:joblance/view/screens/job_info/company_info.dart';
import 'package:joblance/view/screens/job_info/requirments.dart';
import 'package:joblance/view/screens/job_info/task_and_tob_bar.dart';
import 'package:joblance/view/screens/status_screen.dart';

class JobInfo extends StatelessWidget {
  final int id;
  const JobInfo({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(JobInfoControllerImpl(jobId: id, context));
    return Scaffold(
      body: GetBuilder<JobInfoControllerImpl>(
        builder: (controller) => SingleChildScrollView(
          child: controller.statusRequest == StatusRequest.loading
              ? Container()
              : controller.statusRequest == StatusRequest.success
                  ? Column(
                      children: [
                        TaskAndJobTobBar(
                          isOwner: controller.isOwner,
                          onTap: controller.updateJob,
                          onDelete: controller.deleteJob,
                        ),
                        CompanyInfo(
                          companyImage: controller.jobInfoModel.companyImage!,
                          companyName: controller.jobInfoModel.companyName!,
                          numOfEmployees: "51 - 100",
                          jobType: controller.jobInfoModel.jobTypeName!,
                          jobTitle: controller.jobInfoModel.jobTitle!,
                          jobLocation: controller.jobInfoModel.location!,
                          remote: controller.jobInfoModel.remoteName!,
                          major: controller.jobInfoModel.mojorName!,
                          roleId: controller.roleId,
                          isVisible: controller.isVisible,
                          active: controller.jobInfoModel.active!,
                          salary: controller.jobInfoModel.salary,
                          date: controller.jobInfoModel.date!,
                          experience:
                              controller.jobInfoModel.experienceLevelName!,
                          onTap: () {
                            controller.buttonFunction(id);
                          },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        AboutCompany(),
                        AboutJob(
                          abotJob: controller.jobInfoModel.jobDescription!,
                        ),
                        Requirements(
                            requirements:
                                controller.jobInfoModel.requirements!),
                        Visibility(
                          visible:
                              controller.jobInfoModel.additionalInfo != null,
                          child: AdditionalInfo(
                            additionalInfo:
                                controller.jobInfoModel.additionalInfo,
                          ),
                        )
                      ],
                    )
                  : StatusScreen(statusRequest: controller.statusRequest),
        ),
      ),
    );
  }
}
