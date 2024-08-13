import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/widgets/divider.dart';
import 'package:joblance/view/widgets/notification_design.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      child: Icon(Icons.arrow_back)),
                  SizedBox(width: 10.w),
                  Text(
                    "notifications".tr,
                    style: TextStyles.bold17(context),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            NotificationDesign(
                image: AppImages.googleLogo,
                name: "Google",
                notificationBody:
                    "Google posted a new job (IT engineer) Remote",
                notificationDate: "6 hours ago"),
            MyDivider(
              height: 0,
            ),
            NotificationDesign(
                image: AppImages.googleLogo,
                name: "Google",
                notificationBody:
                    "Google posted a new job (IT engineer) Remote",
                notificationDate: "6 hours ago"),
            MyDivider(
              height: 0,
            ),
            NotificationDesign(
                image: AppImages.Linkedin,
                name: "Linkedin",
                notificationBody:
                    "Linkedin posted a new job (AI developer) Remote",
                notificationDate: "6 hours ago"),
            MyDivider(
              height: 0,
            ),
            NotificationDesign(
                image: AppImages.Linkedin,
                name: "Linkedin",
                notificationBody:
                    "Linkedin posted a new job (AI developer) On-site",
                notificationDate: "6 hours ago")
          ],
        ),
      ),
    );
  }
}
