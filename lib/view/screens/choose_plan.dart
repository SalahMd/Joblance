import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/choose_plan_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/widgets/plan_widget.dart';

class ChoosePlan extends StatelessWidget {
  const ChoosePlan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChoosePlanControllerImpl());
    return Scaffold(
      body: GetBuilder<ChoosePlanControllerImpl>(
        builder: (controller) => SingleChildScrollView(
          child: controller.statusRequest == StatusRequest.loading
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 10.w),
                            child: Text(
                              "pleasechooseasubscriptionplan".tr,
                              style: TextStyles.w50015(context),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: 150.w,
                              height: 220.h,
                              child: Image.asset(
                                AppImages.subscription,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    PlanWidget(
                      planName: controller.data[1]['name'],
                      planPrice: controller.data[1]['price'].toString(),
                      features: [
                        'postjobs'.tr,
                        'posttasks'.tr,
                        'searchingfreelancers'.tr,
                        'noads'.tr
                      ],
                      onConfirm: () {
                        controller.confirmSubscription("monthly");
                      },
                      notInclded: ['importantjobs'.tr],
                    ),
                    PlanWidget(
                      planName: controller.data[0]['name'],
                      planPrice: controller.data[0]['price'].toString(),
                      features: [
                        'postjobs'.tr,
                        'posttasks'.tr,
                        'searchingfreelancers'.tr,
                        'noads'.tr
                      ],
                      onConfirm: () {
                        controller.confirmSubscription("annual");
                      },
                      notInclded: ['importantjobs'.tr],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
