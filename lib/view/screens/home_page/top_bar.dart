import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/notifications.dart';

class TopBar extends StatelessWidget {
  final String name;
  final String image;

  const TopBar({super.key, required this.name, required this.image});
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
              Expanded(
                child: Row(children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsetsDirectional.only(end: 10.w),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: image != ""
                          ? Image.network(
                              image[0] == "h"
                                  ? image
                                  : AppLinks.IP + image,
                              fit: BoxFit.cover,
                            )
                          : Container(),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 10.w),
                      child: Text(
                        "hello".tr + ", " + name,
                        style: TextStyles.w50014(context),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ]),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(Notifications());
                },
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  child: Icon(
                    Icons.notifications_outlined,
                    size: 20.sp,
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
          height: 15.h,
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed("Search");
          },
          child: Container(
            width: Dimensions.screenWidth(context),
            height: 45.h,
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
    ).animate().fade(duration: 600.ms).slideY(begin: 0.3);
  }
}
