import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/buttom_bar_controller.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/add_job/add_job.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:joblance/view/screens/add_task/add_task.dart';

class ButtomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ButtomBarControllerImp());
    return GetBuilder<ButtomBarControllerImp>(
      builder: (controllerImp) => Scaffold(
        floatingActionButton: SpeedDial(
          activeIcon: Icons.add,
          icon: Icons.add,
          backgroundColor: controllerImp.subscribed
              ? LightAppColors.primaryColor
              : Colors.grey,
          foregroundColor: LightAppColors.whiteColor,
          overlayColor: LightAppColors.blackColor,
          overlayOpacity: 0.5,
          direction: SpeedDialDirection.up,
          buttonSize: Size(50.w, 50.h),
          childPadding: EdgeInsets.symmetric(vertical: 10.h),
          spacing: 20.h,
          closeManually: false,
          childrenButtonSize: Size(65.w, 65.h),
          children: [
            SpeedDialChild(
              backgroundColor: controllerImp.subscribed
                  ? LightAppColors.primaryColor
                  : Colors.grey,
              labelWidget: Container(
                child: Text(
                  "task".tr,
                  style: TextStyles.w50013White(context),
                ),
              ),
              shape: CircleBorder(),
              onTap: () {
                if (controllerImp.subscribed)
                  Get.to(AddTask(
                    image: controllerImp.image!,
                    name: controllerImp.name!,
                  ));
              },
              child: Icon(Icons.task_outlined,
                  size: 18.sp, color: LightAppColors.whiteColor),
            ),
            controllerImp.role == "1"
                ? SpeedDialChild(
                    backgroundColor: controllerImp.subscribed
                        ? LightAppColors.primaryColor
                        : Colors.grey,
                    labelWidget: Container(
                      child: Text(
                        "job".tr,
                        style: TextStyles.w50013White(context),
                      ),
                    ),
                    shape: CircleBorder(),
                    onTap: () {
                      if (controllerImp.subscribed)
                        Get.to(AddJob(
                          name: controllerImp.name!,
                          image: controllerImp.image!,
                        ));
                    },
                    child: Icon(Icons.work_outline,
                        size: 18.sp, color: LightAppColors.whiteColor),
                    label: "job".tr)
                : SpeedDialChild()
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          color: Color.fromARGB(249, 28, 29, 48),
          shape: CircularNotchedRectangle(),
          height: 65,
          notchMargin: 3.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                splashColor: Color.fromARGB(
                  249,
                  28,
                  29,
                  48,
                ),
                shape: CircleBorder(),
                hoverColor: Color.fromARGB(249, 28, 29, 48),
                highlightColor: Color.fromARGB(249, 28, 29, 48),
                minWidth: 40.w,
                onPressed: () {
                  controllerImp.changePage(0);
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
                          fontSize: 8.sp,
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
                shape: CircleBorder(),
                hoverColor: Color.fromARGB(249, 28, 29, 48),
                highlightColor: Color.fromARGB(249, 28, 29, 48),
                minWidth: 40.w,
                onPressed: () {
                  controllerImp.changePage(1);
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
                          fontSize: 8.sp,
                          color: controllerImp.currentPage == 1
                              ? LightAppColors.primaryColor
                              : Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              MaterialButton(
                splashColor: Color.fromARGB(
                  249,
                  28,
                  29,
                  48,
                ),
                padding: EdgeInsetsDirectional.only(start: 10),
                shape: CircleBorder(),
                hoverColor: Color.fromARGB(249, 28, 29, 48),
                highlightColor: Color.fromARGB(249, 28, 29, 48),
                minWidth: 40.w,
                onPressed: () {
                  controllerImp.changePage(2);
                },
                child: Column(
                  children: [
                    Icon(Icons.notifications,
                        size: 18.sp,
                        color: controllerImp.currentPage == 2
                            ? LightAppColors.primaryColor
                            : Colors.white),
                    Text(
                      "notifications".tr,
                      style: TextStyle(
                          fontSize: 8.sp,
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
                shape: CircleBorder(),
                hoverColor: Color.fromARGB(249, 28, 29, 48),
                highlightColor: Color.fromARGB(249, 28, 29, 48),
                minWidth: 40.w,
                onPressed: () {
                  controllerImp.changePage(3);
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
                          fontSize: 8.sp,
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
