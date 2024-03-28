import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/add_job_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/add_job/company_info.dart';
import 'package:joblance/view/screens/add_job/job_specifications.dart';
import 'package:joblance/view/screens/add_job/job_text_fileds.dart';

class AddJob extends StatelessWidget {
  const AddJob({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddjobControllerImpl());
    return GetBuilder<AddjobControllerImpl>(
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
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
                      style: Theme.of(context).textTheme.headline1,
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
              ),
              SizedBox(
                height: 25.h,
              ),
              JobTextFileds(controller: controller),
              JobSpecifications(controller: controller),
              CompanyInfo(controller: controller),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: Dimensions.screenWidth(context),
                  height: 40.h,
                  margin:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
                  alignment: Alignment.center,
                  decoration: AppButtons.buttonDecoration,
                  child: Text(
                    "post".tr,
                    style: TextStyles.w50016White(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
