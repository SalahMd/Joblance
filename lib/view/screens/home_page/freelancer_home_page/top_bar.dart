import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/notifications.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        SafeArea(
            child: Container(
          width: Dimensions.screenWidth(context),
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsetsDirectional.only(end: 10.w),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      AppImages.Linkedin,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  "hello".tr + ", " + "freelancer".tr,
                  style: TextStyles.w50017(context),
                ),
              ]),
              GestureDetector(
                onTap: () {
                  Get.to(Notifications());
                },
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  child: Icon(
                    Icons.notifications_outlined,
                    size: 25,
                    color: LightAppColors.primaryColor,
                    shadows: [
                      Shadow(
                          color: LightAppColors.greyColor!,
                          offset: Offset(0.2, 0.3),
                          blurRadius: 0.5)
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primaryContainer),
                ),
              ),
            ],
          ),
        )),
        SizedBox(
          height: 20.h,
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed("Search");
          },
          child: Container(
            width: Dimensions.screenWidth(context),
            height: 50.h,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.primaryContainer,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1.5,
                    blurRadius: 1.5,
                    offset: const Offset(0, 1),
                  ),
                ]),
            child: Row(children: [
              SizedBox(width: 15.w),
              const Icon(
                Icons.search,
                size: 25,
              ),
              SizedBox(width: 5.w),
              Text("search".tr, style: TextStyles.w40014grey(context))
            ]),
          ),
        )
      ],
    );
  }
}
