import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/notifications_controller.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/view/widgets/divider.dart';
import 'package:joblance/view/widgets/notification_design.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsControllerImpl());
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<NotificationsControllerImpl>(
          builder: (controller) => SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
