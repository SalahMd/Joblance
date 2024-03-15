import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:joblance/controller/buttom_bar_controller.dart';
import 'package:joblance/core/constants/colors.dart';

class ButtomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ButtomBarControllerImp());
    return GetBuilder<ButtomBarControllerImp>(
      builder: (controllerImp) => Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(249, 28, 29, 48), border: Border.all()),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
            child: GNav(
                selectedIndex: 1,
                gap: 3.w,
                color: Color.fromARGB(249, 28, 29, 48),
                activeColor: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: 5.w, vertical: 10.h), // navigation bar padding
                onTabChange: (index) {
                  controllerImp.changePage(index);
                },
                textSize: 1,
                haptic: true, // haptic feedback
                textStyle: TextStyle(fontSize: 12.sp, color: Colors.white),
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
