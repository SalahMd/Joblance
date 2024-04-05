import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/widgets/divider.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SafeArea(
                  child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back)),
                  SizedBox(width: 10.w),
                  Text("Joblance", style: Theme.of(context).textTheme.headline1)
                ],
              )),
              SizedBox(height: 30.h),
              Text(
                "projectlink".tr,
                style: TextStyles.w50017(context),
              ),
              SizedBox(height: 10.h),
              Text(
                "ww.github/SalahMd/Joblance.com".tr,
                style: TextStyle(color: Colors.blue[700], fontSize: 12.sp),
              ),
              SizedBox(height: 10.h),
              MyDivider(
                height: 5,
              ),
              Text(
                "projectdescription".tr,
                style: TextStyles.w50017(context),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "A flutter project for Jobs and freelaning it is really good project and i am so happy and glad and I feel good.",
                      style: TextStyles.w40012grey(context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              MyDivider(
                height: 5,
              ),
              Text(
                "projectimages".tr,
                style: TextStyles.w50017(context),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 200.h,
                child: Row(
                  children: [
                    Expanded(child: Image.asset(AppImages.cat6)),
                    SizedBox(width: 20.w),
                    Expanded(child: Image.asset(AppImages.cat6))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
