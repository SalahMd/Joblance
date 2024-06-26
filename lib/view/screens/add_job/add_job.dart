import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_job_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/add_job/company_info.dart';
import 'package:joblance/view/screens/add_job/job_specifications.dart';
import 'package:joblance/view/screens/add_job/job_text_fileds.dart';

class AddJob extends StatelessWidget {
  final bool isUpdate;
  final String image, name;
  const AddJob({super.key, this.isUpdate = false, required this.image, required this.name});
  @override
  Widget build(BuildContext context) {
    Get.put(AddjobControllerImpl());
    return GetBuilder<AddjobControllerImpl>(
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                    child: Padding(
                  padding: EdgeInsetsDirectional.only(top: 10.h, bottom: 20.h),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back_outlined)),
                      SizedBox(width: 10.w),
                      Text(
                        "fillyourjobinfo".tr,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 45.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            AppImages.Linkedin,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        "Linkedin",
                        style: TextStyles.w50015(context),
                      )
                    ],
                  ),
                )
                    .animate()
                    .fade(duration: 600.ms, delay: 100.ms)
                    .slideX(begin: 0.1),
                SizedBox(
                  height: 25.h,
                ),
                JobTextFileds(controller: controller),
                JobSpecifications(controller: controller),
                CompanyInfo(controller: controller),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.onSecondary)),
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  padding: EdgeInsetsDirectional.only(
                      start: 20.w, top: 5.h, bottom: 5.h, end: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "showinimportantjobs".tr,
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          PopupMenuButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.info_outline),
                              iconSize: 18.sp,
                              splashRadius: 20,
                              position: PopupMenuPosition.over,
                              surfaceTintColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              itemBuilder: (BuildContext context) {
                                return [
                                  PopupMenuItem(
                                    child: Container(
                                      width: 150.w,
                                      height: 100,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer),
                                      child: Text(
                                        "thisallowsyoutoaddyourjobtoimportantjobsitcoastsonly5"
                                            .tr,
                                        maxLines: 3,
                                        style: TextStyles.w40011grey(context),
                                      ),
                                    ),
                                  )
                                ];
                              }),
                          Checkbox(
                              activeColor: LightAppColors.greenColor,
                              checkColor: LightAppColors.primaryColor,
                              value: controller.importantJobs,
                              onChanged: (val) {
                                controller
                                    .changeCheckBoxValue("importantjonbs");
                              }),
                        ],
                      ),
                    ],
                  ),
                )
                    .animate()
                    .fade(duration: 600.ms, delay: 1400.ms)
                    .slideY(begin: 0.3),
                GestureDetector(
                  onTap: () {
                    controller.addJob(isUpdate);
                  },
                  child: Container(
                    width: Dimensions.screenWidth(context),
                    height: 40.h,
                    margin:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
                    alignment: Alignment.center,
                    decoration: AppButtons.buttonDecoration,
                    child: Text(
                      !isUpdate ? "post".tr : "update".tr,
                      style: TextStyles.w50016White(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
