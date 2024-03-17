import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/view/widgets/message_design.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: exitAlert,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SafeArea(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    "messages".tr,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                )),
                SizedBox(
                  height: 20.h,
                ),
                MessageDesign(
                    image: AppImages.Linkedin,
                    messengerName: "Linkedin",
                    message: "Hi there, what's up, are you home?",
                    date: "2 hours"),
                MessageDesign(
                    image: AppImages.googleLogo,
                    messengerName: "Google",
                    message: "Hi there, what's up, I miss you so much",
                    date: "2 hours"),
                MessageDesign(
                    image: AppImages.googleLogo,
                    messengerName: "Google",
                    message: "Hi there, what's up, check our new job chance",
                    date: "2 hours"),
              ],
            ),
          ),
        ));
  }
}
