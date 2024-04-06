import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:joblance/controller/buttom_bar_controller.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/add_job/add_job.dart';

class ButtomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ButtomBarControllerImp());
    return GetBuilder<ButtomBarControllerImp>(
      builder: (controllerImp) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: LightAppColors.primaryColor,
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            size: 25.sp,
            color: LightAppColors.whiteColor,
          ),
          onPressed: () {
            controllerImp.role == "1" ? Get.to(AddJob()) : null;
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(249, 28, 29, 48),
          shape: CircularNotchedRectangle(),
          height: 65.h,
          notchMargin: 5.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                // color: LightAppColors.primaryColor,
                splashColor: Color.fromARGB(
                  249,
                  28,
                  29,
                  48,
                ),
                hoverColor: Color.fromARGB(249, 28, 29, 48),
                // focusColor: Color.fromARGB(249, 28, 29, 48),
                highlightColor: Color.fromARGB(249, 28, 29, 48),
                minWidth: 40.w,
                onPressed: () {
                  controllerImp.currentPage = 0;
                  controllerImp.update();
                },
                child: Column(
                  children: [
                    Icon(Icons.person_outline,
                        size: 18.sp,
                        color: controllerImp.currentPage == 0
                            ? LightAppColors.primaryColor
                            : Colors.white),
                    Text(
                      "profile".tr,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: controllerImp.currentPage == 0
                              ? LightAppColors.primaryColor
                              : Colors.white),
                    )
                  ],
                ),
              ),
              MaterialButton(
                splashColor: Color.fromARGB(
                  249,
                  28,
                  29,
                  48,
                ),
                hoverColor: Color.fromARGB(249, 28, 29, 48),
                // focusColor: Color.fromARGB(249, 28, 29, 48),
                highlightColor: Color.fromARGB(249, 28, 29, 48),
                minWidth: 40.w,
                onPressed: () {
                  controllerImp.currentPage = 1;
                  controllerImp.update();
                },
                child: Column(
                  children: [
                    Icon(Icons.home_outlined,
                        size: 18.sp,
                        color: controllerImp.currentPage == 1
                            ? LightAppColors.primaryColor
                            : Colors.white),
                    Text(
                      "home".tr,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: controllerImp.currentPage == 1
                              ? LightAppColors.primaryColor
                              : Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              MaterialButton(
                splashColor: Color.fromARGB(
                  249,
                  28,
                  29,
                  48,
                ),
                hoverColor: Color.fromARGB(249, 28, 29, 48),
                highlightColor: Color.fromARGB(249, 28, 29, 48),
                minWidth: 40.w,
                onPressed: () {
                  controllerImp.currentPage = 2;
                  controllerImp.update();
                },
                child: Column(
                  children: [
                    Icon(Icons.message_outlined,
                        size: 18.sp,
                        color: controllerImp.currentPage == 2
                            ? LightAppColors.primaryColor
                            : Colors.white),
                    Text(
                      "message".tr,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: controllerImp.currentPage == 2
                              ? LightAppColors.primaryColor
                              : Colors.white),
                    )
                  ],
                ),
              ),
              MaterialButton(
                autofocus: false,
                splashColor: Color.fromARGB(
                  249,
                  28,
                  29,
                  48,
                ),
                hoverColor: Color.fromARGB(249, 28, 29, 48),
                // focusColor: Color.fromARGB(249, 28, 29, 48),
                highlightColor: Color.fromARGB(249, 28, 29, 48),
                minWidth: 40.w,
                onPressed: () {
                  controllerImp.currentPage = 3;
                  controllerImp.update();
                },
                child: Column(
                  children: [
                    Icon(Icons.settings_outlined,
                        size: 18.sp,
                        color: controllerImp.currentPage == 3
                            ? LightAppColors.primaryColor
                            : Colors.white),
                    Text(
                      "settings".tr,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: controllerImp.currentPage == 3
                              ? LightAppColors.primaryColor
                              : Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: controllerImp.listPage.elementAt(controllerImp.currentPage),
      ),
    );
  }
}
