import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/job_info_controller.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';

class AddToImportantJob extends StatelessWidget {
  const AddToImportantJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
                "allimportantjobs".tr,
                style: TextStyles.w50019(context),
              ),
            ]),
          )),
          SizedBox(height: 10.h),
          Text(
            "thiswilladdyourjobtoimportantjobslist".tr,
            style: TextStyles.w50015(context),
          ),
          SizedBox(height: 10.h),
          Text(
            "importantjobexplain".tr,
            style: TextStyles.w40014grey(context),
          ),
          SizedBox(height: 20.h),
          Text(
            "pleasechoosepaymentmethod".tr,
            style: TextStyles.w50014(context),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: GetBuilder<JobInfoControllerImpl>(
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    height: 35.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                            width: 30.w,
                            height: 30.h,
                            child: Image.asset(
                              AppImages.paypalLogo,
                              fit: BoxFit.fill,
                            )),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "paypal".tr,
                          style: TextStyles.w50013(context),
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      controller.addToImportantJobs();
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        height: 35.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "budget".tr,
                          style: TextStyles.w50013(context),
                        )),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
