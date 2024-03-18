import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/divider.dart';
import 'package:joblance/view/widgets/job_design.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: Dimensions.screenWidth(context),
                  height: 180.h,
                  color: Colors.grey,
                  child: Image.asset(
                    AppImages.joblance,
                    fit: BoxFit.fill,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SafeArea(
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  height: 110,
                  alignment: Alignment.center,
                  margin: EdgeInsetsDirectional.only(start: 5.w, top: 125.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        AppImages.googleLogo,
                        fit: BoxFit.fill,
                      )),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Google",
                        style: TextStyles.w50017(context),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Softwere development company",
                        style: TextStyles.w50012(context),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "10 M Followers",
                        style: TextStyles.w40012grey(context),
                      ),
                      Text(
                        "10k" + "employees".tr,
                        style: TextStyles.w40012grey(context),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 40.h,
                            alignment: Alignment.center,
                            decoration: AppButtons.buttonDecoration,
                            child: Text("follow".tr,
                                style: TextStyles.w50013White(context)),
                          )),
                          SizedBox(width: 10.w),
                          Expanded(
                              child: Container(
                            height: 40.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary)),
                            child: Text("message".tr,
                                style: TextStyles.w50013White(context)),
                          )),
                        ],
                      ),
                    ])),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              height: 1,
              thickness: 0.5,
            ),
            Container(
              width: Dimensions.screenWidth(context),
              height: 50.h,
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("jobs".tr),
                      )),
                  VerticalDivider(),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("about".tr),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Text(
                "jobs".tr,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            JobDesign(
                jobTitle: "React developer",
                companyName: "Google",
                location: "United states",
                date: "9 days ago",
                remote: "remote".tr,
                image: AppImages.googleLogo,
                isActive: false),
            JobDesign(
                jobTitle: "React developer",
                companyName: "Google",
                location: "United states",
                date: "9 days ago",
                remote: "remote".tr,
                image: AppImages.googleLogo,
                isActive: false),
            JobDesign(
                jobTitle: "React developer",
                companyName: "Google",
                location: "United states",
                date: "9 days ago",
                remote: "remote".tr,
                image: AppImages.googleLogo,
                isActive: false),
            JobDesign(
                jobTitle: "React developer",
                companyName: "Google",
                location: "United states",
                date: "9 days ago",
                remote: "remote".tr,
                image: AppImages.googleLogo,
                isActive: false)
          ],
        ),
      ),
    );
  }
}
