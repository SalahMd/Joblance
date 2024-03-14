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
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4),
            child: GNav(
                selectedIndex: 1,
                //hoverColor: lightAppColors.whiteColor,
                //backgroundColor: Color.fromARGB(249, 28, 29, 48),
                gap: 8.w,
                color: Color.fromARGB(249, 28, 29, 48),
                activeColor: Colors.blue,
                padding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10), // navigation bar padding
                onTabChange: (index) {
                  controllerImp.changePage(index);
                },
                textSize: 2,
                haptic: true, // haptic feedback
                textStyle: TextStyle(fontSize: 15.sp, color: Colors.blue),
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
