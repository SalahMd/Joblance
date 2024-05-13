import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/settings_controller/settings_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/edit_profile/edit_profile.dart';
import 'package:joblance/view/screens/my_jobs/my_jobs.dart';
import 'package:joblance/view/screens/settings/change_language.dart';
import 'package:joblance/view/screens/settings/change_password.dart';
import 'package:joblance/view/screens/settings/dark_mode.dart';
import 'package:joblance/view/screens/settings/report.dart';
import 'package:joblance/view/widgets/list_tile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsControllerImpl());
    return GetBuilder<SettingsControllerImpl>(
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.w, vertical: 10.h),
                      child: Text("account".tr,
                          style: TextStyles.w40014grey(context))),
                ),
                Container(
                    width: Dimensions.screenWidth(context),
                    //  height: 150.h,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            Theme.of(context).colorScheme.primaryContainer),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(EditProfile());
                            },
                            child: ListTiles(
                                leadingIcon: Icons.edit_outlined,
                                trailingIcon:
                                    Icons.arrow_forward_ios_outlined,
                                listText: "editprofile".tr),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(CahngePassword());
                            },
                            child: ListTiles(
                                leadingIcon: Icons.lock_outline,
                                trailingIcon:
                                    Icons.arrow_forward_ios_outlined,
                                listText: "changepassword".tr),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(MyJobs());
                            },
                            child: ListTiles(
                                leadingIcon: Icons.work_outline,
                                trailingIcon:
                                    Icons.arrow_forward_ios_outlined,
                                listText: "myjobs".tr),
                          ),
                        ])),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                    child: Text("general".tr,
                        style: TextStyles.w40014grey(context))),
                Container(
                  width: Dimensions.screenWidth(context),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
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
                      GestureDetector(
                        onTap: () {
                          controller.logOut();
                        },
                        child: ListTiles(
                            leadingIcon: Icons.logout_outlined,
                            trailingIcon: Icons.arrow_forward_ios_outlined,
                            listText: "logout".tr),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                    child: Text("helpcenter".tr,
                        style: TextStyles.w40014grey(context))),
                Container(
                  width: Dimensions.screenWidth(context),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
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
