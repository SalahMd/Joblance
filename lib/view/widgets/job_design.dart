import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/job_info/job_info.dart';

class JobDesign extends StatelessWidget {
  const JobDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(JobInfo());
      },
      child: Container(
        width: Dimensions.screenwidth(context),
        // height: 110,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Flutter Developer",
                      style: TextStyles.w50014(context),
                    ),
                    //SizedBox(height: .h),
                    Text(
                      "Linkedin",
                      style: TextStyles.w50012(context),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      "United states" + " - " + "OnSite",
                      style: TextStyles.w40011grey(context),
                    ),
                    //SizedBox(height: 3.h),
                    Text(
                      "2 weeks ago",
                      style: TextStyles.w4009grey(context),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.h, top: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Container(
                        width: 20.w,
                        height: 20.h,
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: Image.asset(
                          AppImages.save,
                          fit: BoxFit.fill,
                          color: Theme.of(context).colorScheme.onSecondary,
                        )),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 60.w,
                    height: 25.h,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: LightAppColors.greenColor),
                        ),
                        Text(
                          "active".tr,
                          style: TextStyles.w40011(context),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
