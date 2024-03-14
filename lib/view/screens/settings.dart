
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/list_tile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SafeArea(
              //     child: Padding(
              //         padding: EdgeInsets.symmetric(
              //             horizontal: 10.w, vertical: 10.h),
              //         child: Text(
              //           "settings".tr,
              //           style: Theme.of(context).textTheme.headline1,
              //         ))),
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
                        ListTiles(
                            leadingIcon: Icons.person_outline,
                            trailingIcon: Icons.keyboard_arrow_right_outlined,
                            listText: "profile".tr),
                        ListTiles(
                            leadingIcon: Icons.work_outlined,
                            trailingIcon: Icons.keyboard_arrow_right_outlined,
                            listText: "applaiedjobs".tr),
                      ])),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                  child: Text("general".tr, style: TextStyles.w40014grey)),
              Container(
                width: Dimensions.screenwidth(context),
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primaryContainer),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTiles(
                        leadingIcon: Icons.language_outlined,
                        trailingIcon: Icons.keyboard_arrow_right_outlined,
                        listText: "language".tr),
                    ListTiles(
                        leadingIcon: Icons.dark_mode_outlined,
                        trailingIcon: Icons.keyboard_arrow_right_outlined,
                        listText: "appmode".tr),
                    ListTiles(
                        leadingIcon: Icons.logout_outlined,
                        trailingIcon: Icons.keyboard_arrow_right_outlined,
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
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primaryContainer),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTiles(
                        leadingIcon: Icons.info_outline,
                        trailingIcon: Icons.keyboard_arrow_right_outlined,
                        listText: "abouttheapp".tr),
                    ListTiles(
                        leadingIcon: Icons.report_outlined,
                        trailingIcon: Icons.keyboard_arrow_right_outlined,
                        listText: "report".tr),
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
    );
  }
}
