import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/dark_mode.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/widgets/divider.dart';

class DarkMode extends StatelessWidget {
  const DarkMode({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(DarkModeImpl());
    return Scaffold(
      body: GetBuilder<DarkModeImpl>(
        builder: (controller) =>
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 10.h,
          ),
          SafeArea(
              child: Row(
            children: [
              SizedBox(width: 10.w),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_outlined)),
              SizedBox(width: 10.w),
              Text(
                "choosemode".tr,
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          )),
          SizedBox(height: 50.h),
          GestureDetector(
            onTap: () {
              controller.changeMode("dark");
            },
            child: Container(
                height: 60.h,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "darkmode".tr,
                        style: TextStyles.bold17,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 7.w),
                        child: SizedBox(
                          width: 35.w,
                          height: 35.h,
                          child: Image.asset(
                            AppImages.moon,
                            color: Colors.blue,
                          ),
                          // child: AppAnimations.darkMode,
                        ),
                      ),
                    ])),
          ),
          MyDivider(),
          GestureDetector(
            onTap: () {
              controller.changeMode("light");
            },
            child: Container(
              height: 60.h,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "lightmode".tr,
                    style: TextStyles.bold17,
                  ),
                  Container(
                    width: 40.w,
                    height: 40.h,
                    margin: EdgeInsetsDirectional.only(end: 3.w),
                    child: Image.asset(
                      AppImages.sun,
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
