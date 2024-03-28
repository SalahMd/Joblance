import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/profiles_controller/company_profile_controller.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/view/screens/profile/company_profile/company_tab_bar.dart';
import 'package:joblance/view/screens/profile/tob_bar.dart';
import 'package:joblance/view/widgets/tab_bar.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CompanyProfileControllerImpl());
    return Scaffold(
      body: GetBuilder<CompanyProfileControllerImpl>(
        builder: (controller) => DefaultTabController(
          length: controller.tabs.length,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TobBar(
                  image: AppImages.googleLogo,
                  name: "Google",
                  description: "Softwere development company",
                ),
                SizedBox(
                  height: 15.h,
                ),
                Divider(
                  height: 1,
                  thickness: 0.5,
                ),
                TabBarWidget(
                  tabs: controller.tabs,
                ),
                Column(
                  children: [
                    CompanyTabBar(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
