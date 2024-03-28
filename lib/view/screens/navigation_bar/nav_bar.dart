import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:joblance/controller/buttom_bar_controller.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/view/screens/add_job/add_job.dart';

class ButtomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ButtomBarControllerImp());
    return GetBuilder<ButtomBarControllerImp>(
      builder: (controllerImp) => Scaffold(
        bottomNavigationBar: controllerImp.role != "3"
            ? Stack(
                children: [
                  Container(
                    height: 60.h,
                    alignment: Alignment.bottomCenter,
                    color: Theme.of(context).colorScheme.background,
                    child: Stack(
                      children: [
                        Container(
                          height: 55.h,
                          color: Color.fromARGB(249, 28, 29, 48),
                          padding:
                              EdgeInsets.only(left: 7.w, right: 7.w, top: 8.h),
                          child: GNav(
                              selectedIndex: 1,
                              gap: 2.w,
                              color: Color.fromARGB(249, 28, 29, 48),
                              activeColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 10.h), // navigation bar padding
                              onTabChange: (index) {
                                controllerImp.changePage(index);
                              },
                              textSize: 1,
                              haptic: true, // haptic feedback
                              textStyle: TextStyle(
                                  fontSize: 10.sp, color: Colors.white),
                              tabs: [
                                GButton(
                                  icon: Icons.account_circle_outlined,
                                  // text: 'profile'.tr,
                                  iconColor: LightAppColors.primaryColor,
                                  //    textSize: 5,
                                ),
                                GButton(
                                  icon: Icons.home_outlined,
                                  // text: 'homepage'.tr,
                                  iconColor: LightAppColors.primaryColor,
                                  padding:
                                      EdgeInsetsDirectional.only(end: 30.w),
                                ),
                                GButton(
                                  icon: Icons.message_outlined,
                                  //text: 'messages'.tr,
                                  iconColor: LightAppColors.primaryColor,
                                  padding:
                                      EdgeInsetsDirectional.only(start: 30.w),
                                ),
                                GButton(
                                  icon: Icons.settings_outlined,
                                  //text: 'settings'.tr,
                                  iconColor: LightAppColors.primaryColor,
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controllerImp.role != "3",
                    child: GestureDetector(
                      onTap: () {
                        Get.to(AddJob());
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsetsDirectional.only(
                          start: 138.w,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: LightAppColors.primaryColor),
                        child: Icon(Icons.add),
                      ),
                    ),
                  )
                ],
              )
            : Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(249, 28, 29, 48),
                    border: Border.all()),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
                  child: GNav(
                      selectedIndex: 1,
                      gap: 3.w,
                      color: Color.fromARGB(249, 28, 29, 48),
                      activeColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 10.h), // navigation bar padding
                      onTabChange: (index) {
                        controllerImp.changePage(index);
                      },
                      textSize: 1,
                      haptic: true, // haptic feedback
                      textStyle:
                          TextStyle(fontSize: 12.sp, color: Colors.white),
                      tabs: [
                        GButton(
                          icon: Icons.account_circle_outlined,
                          text: 'profile'.tr,
                          iconColor: LightAppColors.primaryColor,
                          //    textSize: 5,
                        ),
                        GButton(
                          icon: Icons.home_outlined,
                          text: 'homepage'.tr,
                          iconColor: LightAppColors.primaryColor,
                        ),
                        GButton(
                          icon: Icons.message_outlined,
                          text: 'messages'.tr,
                          iconColor: LightAppColors.primaryColor,
                        ),
                        GButton(
                          icon: Icons.settings_outlined,
                          text: 'settings'.tr,
                          iconColor: LightAppColors.primaryColor,
                        ),
                      ]),
                ),
              ),
        body: controllerImp.listPage.elementAt(controllerImp.currentPage),
      ),
    );
  }
}
