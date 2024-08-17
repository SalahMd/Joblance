import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:joblance/controller/job_application_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/view/widgets/divider.dart';
import '../../core/constants/text_styles.dart';

class JobApplicationPage extends StatelessWidget {
  final String id;
  const JobApplicationPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(JobApplicationController(id: id));
    return Scaffold(
        body: GetBuilder<JobApplicationController>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? Container()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SafeArea(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back)),
                      SizedBox(width: 10.w),
                      Text(
                        "application".tr,
                        style: TextStyles.w50019(context),
                      ),
                    ]),
                  )),
                  Container(
                      // width: Dimensions.screenWidth(context),
                      padding: EdgeInsets.all(15.sp),
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Container(
                                width: 50.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                child: ClipRRect(
                                    child: Image.network(
                                      AppLinks.IP +
                                          controller.application.image!,
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.application.firstName! +
                                          " " +
                                          controller.application.lastName!,
                                      style: TextStyles.w50015(context),
                                    ),
                                    Text(
                                      controller.application.phoneNumber!,
                                      style: TextStyles.w50015(context),
                                    ),
                                  ]),
                            ]),
                            // SizedBox(
                            //   height: 15.w,
                            // ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.mail_outline,
                                  size: 17.sp,
                                  color: LightAppColors.greyColor,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  controller.application.email!,
                                  style: TextStyles.w40013grey(context),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.cases_outlined,
                                  size: 17.sp,
                                  color: LightAppColors.greyColor,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  controller.application.majorName!,
                                  style: TextStyles.w40013grey(context),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 17.sp,
                                  color: LightAppColors.greyColor,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  Jiffy.parse(controller.application.createdAt!)
                                      .fromNow()
                                      .toString(),
                                  style: TextStyles.w40013grey(context),
                                ),
                              ],
                            )
                          ])),
                  MyDivider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "coverletter".tr,
                      style: TextStyles.w50015(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Visibility(
                      visible: controller.application.coverLetter != null,
                      child: Text(
                        controller.application.coverLetter!,
                        style: TextStyles.w40012grey(context),
                      ),
                    ),
                  ),
                  MyDivider(),
                  SizedBox(
                    height: 40.h,
                  ),
                  controller.downloadFileStatus == StatusRequest.loading
                      ? Container(
                          alignment: Alignment.center,
                          child: AppAnimations.loadings,
                        )
                      : controller.downloadFileStatus == StatusRequest.success
                          ? Container(
                              alignment: Alignment.center,
                              child: AppAnimations.done,
                            )
                          : GestureDetector(
                              onTap: () {
                                controller.downloadFile(context);
                              },
                              child: Container(
                                height: 70.h,
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 70.w,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.file_copy,
                                        size: 30.sp, color: Colors.red[800]),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "download".tr + " " + "cv".tr,
                                      style: TextStyles.w50014(context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                  GestureDetector(
                    onTap: () {
                      controller.accept();
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 30.h),
                        width: 150.w,
                        alignment: Alignment.center,
                        height: 40.h,
                        decoration: AppButtons.buttonDecoration,
                        child: Text('accept'.tr,
                            style: TextStyles.w50013White(context)),
                      ),
                    ),
                  )
                ],
              ),
            ),
    ));
  }
}
