import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/categories.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/slider.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/swiper.dart';
import 'package:joblance/view/screens/home_page/freelancer_home_page/top_bar.dart';
import 'package:joblance/view/widgets/job_design.dart';

class FreelancerHomePage extends StatelessWidget {
  const FreelancerHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 15.w, top: 20.h, bottom: 20.h),
                  child: Text(
                    "popularjobs".tr,
                    style: TextStyles.bold20,
                  )),
            ),
            Swiper(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 15.w, top: 10.h, bottom: 10.h),
                  child: Text(
                    "categories".tr,
                    style: TextStyles.bold20,
                  )),
            ),
            Categories(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 15.w, top: 10.h, bottom: 5.h),
                  child: Text(
                    "recentjobs".tr,
                    style: TextStyles.bold20,
                  )),
            ),
            JobDesign(),
            JobDesign(),
            JobDesign(),
            JobDesign(),
            JobDesign()
          ],
        ),
      ),
    );
  }
}
