import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/features/add_to_important_jobs/presentation/screens/add_to_important_job.dart';
import 'package:joblance/features/job_info/controller/job_info_controller.dart';
import 'package:joblance/features/job_info/presentation/widgets/about_company.dart';
import 'package:joblance/features/job_info/presentation/widgets/about_job.dart';
import 'package:joblance/features/job_info/presentation/widgets/additiona_info.dart';
import 'package:joblance/features/job_info/presentation/widgets/requirments.dart';
import 'package:joblance/features/job_info/presentation/widgets/task_and_tob_bar.dart';
import 'package:joblance/features/status_screen/status_screen.dart';

import '../widgets/company_info.dart';


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
                        Visibility(
                          visible: controller.isOwner,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(AddToImportantJob());
                            },
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 15.h),
                                width: 160.w,
                                height: 35.h,
                                alignment: Alignment.center,
                                decoration: AppButtons.buttonDecoration,
                                child: Text(
                                  "addtoimportanjob".tr,
                                  style: TextStyles.w50013White(context),
                                ),
                              ),
                            ),
                          ),
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
