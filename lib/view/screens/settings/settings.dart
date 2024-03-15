import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/settings/change_language.dart';
import 'package:joblance/view/screens/settings/dark_mode.dart';
import 'package:joblance/view/screens/settings/report.dart';
import 'package:joblance/view/widgets/list_tile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exitAlert,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      child: Text("account".tr, style: TextStyles.w40014grey)),
                ),
                Container(
                    width: Dimensions.screenwidth(context),
                    //  height: 150.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primaryContainer),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //  Get.to(FreelancerProfile());
                            },
                            child: ListTiles(
                                leadingIcon: Icons.person_outline,
                                trailingIcon: Icons.arrow_forward_ios_outlined,
                                listText: "profile".tr),
                          ),
                          ListTiles(
                              leadingIcon: Icons.work_outlined,
                              trailingIcon: Icons.arrow_forward_ios_outlined,
                              listText: "applaiedjobs".tr),
                          ListTiles(
                              leadingIcon: Icons.save_outlined,
                              trailingIcon: Icons.arrow_forward_ios_outlined,
                              listText: "savedjobs".tr),
                        ])),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                    child: Text("general".tr, style: TextStyles.w40014grey)),
                Container(
                  width: Dimensions.screenwidth(context),
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primaryContainer),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(ChangeTheLanguage());
                        },
                        child: ListTiles(
                            leadingIcon: Icons.language_outlined,
                            trailingIcon: Icons.arrow_forward_ios_outlined,
                            listText: "language".tr),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(DarkMode());
                        },
                        child: ListTiles(
                            leadingIcon: Icons.dark_mode_outlined,
                            trailingIcon: Icons.arrow_forward_ios_outlined,
                            listText: "appmode".tr),
                      ),
                      ListTiles(
                          leadingIcon: Icons.logout_outlined,
                          trailingIcon: Icons.arrow_forward_ios_outlined,
                          listText: "logout".tr)
                    ],
                  ),
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                    child: Text("helpcenter".tr, style: TextStyles.w40014grey)),
                Container(
                  width: Dimensions.screenwidth(context),
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primaryContainer),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTiles(
                          leadingIcon: Icons.info_outline,
                          trailingIcon: Icons.arrow_forward_ios_outlined,
                          listText: "abouttheapp".tr),
                      GestureDetector(
                        onTap: () {
                          Get.to(Report());
                        },
                        child: ListTiles(
                            leadingIcon: Icons.report_outlined,
                            trailingIcon: Icons.arrow_forward_ios_outlined,
                            listText: "report".tr),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
