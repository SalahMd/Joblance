import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/core/functions/payment.dart';
import 'package:joblance/view/widgets/chips_choice.dart';

Future<bool> exitAlert() {
  Get.defaultDialog(
      title: "",
      middleText: "warningbody".tr,
      middleTextStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
      actions: [
        TextButton(
          onPressed: () {
            exit(0);
          },
          child: Text(
            "yes".tr,
            style: const TextStyle(color: Colors.blue),
          ),
        ),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "no".tr,
              style: const TextStyle(color: Colors.blue),
            ))
      ]);
  return Future.value(false);
}

Future<bool> subscriptionAlert(Function() onChoosePlan) {
  Get.defaultDialog(
      title: "youhavenosubscription".tr,
      //middleText: "youhavenosubscription".tr,
      titleStyle: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
      ),
      titlePadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      content: Container(
          alignment: Alignment.topCenter,
          height: 100.h,
          child: AppAnimations.subscription),
      barrierDismissible: false,
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
              onChoosePlan();
            },
            child: Text(
              "chooseplan".tr,
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            )),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("cancel".tr,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500)))
      ]);
  return Future.value(false);
}

Future<bool> exitAlertt() async {
  return await (Get.defaultDialog(
          title: "",
          middleText: "warningbody".tr,
          middleTextStyle:
              TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          actions: [
            TextButton(
              onPressed: () {
                exit(0);
              },
              child: Text(
                "yes".tr,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "no".tr,
                  style: const TextStyle(color: Colors.blue),
                ))
          ])) ??
      false;
}

Future<bool> animationedAlertWithActions(
    var animation, String title, Function() onYesTap) {
  Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
      titlePadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      content: animation != null
          ? Container(
              alignment: Alignment.topCenter, height: 100.h, child: animation)
          : null,
      barrierDismissible: false,
      actions: [
        TextButton(
            onPressed: onYesTap,
            child: Text(
              "yes".tr,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            )),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("no".tr,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)))
      ]);
  return Future.value(true);
}

deleteMessages(
    BuildContext context, void Function() func1, void Function() func2) {
  TextStyle style = TextStyle(
      fontSize: 12.sp,
      color: LightAppColors.primaryColor,
      fontWeight: FontWeight.w500);
  Get.defaultDialog(
      title: "",
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      buttonColor: LightAppColors.primaryColor,
      titlePadding: EdgeInsets.zero,
      confirmTextColor: LightAppColors.whiteColor,
      content: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: func1,
                child: Container(
                  child: Text(
                    "deleteforeveryone".tr,
                    style: style,
                  ),
                )),
            SizedBox(
              height: 3.h,
            ),
            GestureDetector(
                onTap: func2,
                child: Container(
                  child: Text(
                    "deleteforme".tr,
                    style: style,
                  ),
                )),
            SizedBox(
              height: 3.h,
            ),
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  child: Text(
                    "cancel".tr,
                    style: style,
                  ),
                ))
          ],
        ),
      ));
}

bool normalAlert(
  String title,
  String body,
  BuildContext context,
) {
  bool action = false;
  Get.defaultDialog(
      title: "",
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      buttonColor: LightAppColors.primaryColor,
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      confirmTextColor: LightAppColors.whiteColor,
      content: Text(
        body,
        style: TextStyles.w40012grey(context),
      ),
      barrierDismissible: true,
      actions: [
        TextButton(
            onPressed: () {
              action = true;
              Get.back();
            },
            child: Text("yes".tr)),
        TextButton(
            onPressed: () {
              action = false;
              Get.back();
            },
            child: Text("no".tr))
      ]);
  return action;
}

paymentAlert(String text, String body, BuildContext context) {
  Get.defaultDialog(
    title: "",
    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    buttonColor: LightAppColors.primaryColor,
    titlePadding: EdgeInsets.zero,
    confirmTextColor: LightAppColors.whiteColor,
    content: Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyles.w50015(context),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            body,
            style: TextStyles.w40012grey(context),
          ),
        ],
      ),
    ),
    barrierDismissible: true,
    onConfirm: () {
      Get.back();
      payment(context, "10");
    },
  );
  return Future.value(true);
}

Future<double> rateDialog(String title, BuildContext context) async {
  var level = 4.0;
  Completer<double> completer = Completer<double>();

  await Get.defaultDialog(
    title: title,
    titleStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
    titlePadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
    content: Column(
      children: [
        RatingBar.builder(
          direction: Axis.horizontal,
          allowHalfRating: true,
          initialRating: 4,
          itemCount: 5,
          itemSize: 30,
          unratedColor: Colors.grey,
          itemBuilder: (context, index) {
            return Icon(
              Icons.star,
              size: 20.sp,
              color: Colors.yellow[700],
            );
          },
          onRatingUpdate: (rate) {
            level = rate;
          },
        ),
        SizedBox(height: 30.h),
        GestureDetector(
          onTap: () {
            completer.complete(level);
            Get.back();
          },
          child: Container(
            width: 90.w,
            height: 27.h,
            decoration: AppButtons.buttonDecoration,
            alignment: Alignment.center,
            child: Text(
              "confirm".tr,
              style: TextStyles.w50012White(context),
            ),
          ),
        ),
      ],
    ),
  );

  return completer.future;
}

Future<bool> animationedAlert(var animation, String title) {
  Get.defaultDialog(
    title: title,
    titleStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
    titlePadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
    content: animation != null
        ? Container(
            alignment: Alignment.center, height: 100.h, child: animation)
        : null,
    barrierDismissible: false,
  );
  return Future.value(true);
}

snackBar(String title, String message, BuildContext context) {
  Get.snackbar(title, message,
      duration: const Duration(seconds: 4),
      titleText: Text(
        title,
        style: TextStyles.w50012(context),
      ),
      borderWidth: 0.8,
      borderColor: LightAppColors.primaryColor,
      padding: EdgeInsets.only(bottom: 18.h, left: 10.w, right: 10.w, top: 0),
      messageText: Text(
        message,
        style: TextStyles.w50013(context),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(bottom: 10.h, left: 10.w, right: 10.w));
}

Future<bool> popUp(
    BuildContext context,
    List<Map<String, String>> jobTypes,
    List<Map<String, String>> remote,
    List<Map<String, String>> experience,
    List<Map<String, String>> majors,
    void Function() tap,
    bool isJob
    //List search
    ) {
  Get.bottomSheet(Container(
    width: Dimensions.screenWidth(context),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Theme.of(context).colorScheme.primaryContainer),
    child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 60.w,
                height: 8.h,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: LightAppColors.greyColor,
                    borderRadius: BorderRadius.circular(50)),
              ),
            )),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
          child: Text(
            "filter".tr,
            style: TextStyles.bold17(context),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
          child: Text(
            "categories".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        ChipsChoices(options: majors, search: 'majors'),

        //SizedBox(height:10.h),
        Visibility(
          visible: isJob,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
            child: Text(
              "jobtype".tr,
              style: TextStyles.w50015(context),
            ),
          ),
        ),
         Visibility(
          visible: isJob,
          child: ChipsChoices(
            options: jobTypes,
            search: 'jobtype',
          ),
        ),
   Visibility(
          visible: isJob,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 10.w,
            ),
            child: Text(
              "jobexperince".tr,
              style: TextStyles.w50015(context),
            ),
          ),
        ),
         Visibility(
          visible: isJob,
          child: ChipsChoices(
            options: experience,
            search: 'experience',
          ),
        ),
         Visibility(
          visible: isJob,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
            child: Text(
              "remote".tr,
              style: TextStyles.w50015(context),
            ),
          ),
        ),
        Visibility(
          visible: isJob,
          child: ChipsChoices(
            options: remote,
            search: 'remote',
          ),
        ),
         Visibility(
          visible: !isJob,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
            child: Text(
              "duration".tr,
              style: TextStyles.w50015(context),
            ),
          ),
        ),
        Visibility(
          visible: !isJob,
          child: ChipsChoices(
            options: [{"0":'high'.tr},{"1":'low'.tr}],
            search: 'duration',
          ),
        ),
        // Padding(
        //   padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
        //   child: Text(
        //     "dateposted".tr,
        //     style: TextStyles.w50015(context),
        //   ),
        // ),
        // ChipsChoices(options: [
        //   "lastweek".tr,
        //   "lastmonth".tr,
        // ]),
        InkWell(
          onTap: () {
            tap();
            Get.back();
          },
          child: Container(
            width: Dimensions.screenWidth(context),
            height: 40.h,
            margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            alignment: Alignment.center,
            decoration: AppButtons.buttonDecoration,
            child: Text(
              "confirm".tr,
              style: TextStyles.w50016White(context),
            ),
          ),
        ),
      ]),
    ),
  ));
  return Future.value(true);
}

Future<bool> applicantsFilter(
  BuildContext context,
) {
  Get.bottomSheet(Container(
    width: Dimensions.screenWidth(context),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Theme.of(context).colorScheme.primaryContainer),
    child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 60.w,
                height: 8.h,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: LightAppColors.greyColor,
                    borderRadius: BorderRadius.circular(50)),
              ),
            )),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
          child: Text(
            "filter".tr,
            style: TextStyles.bold17(context),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 10.w,
          ),
          child: Text(
            "yearsofexperience".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        // ChipsChoices(options: [
        //   "1 year".tr,
        //   "2 years".tr,
        //   "3 years".tr,
        //   "4 and above".tr
        // ]),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
          child: Text(
            "expectedsalary".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        // ChipsChoices(options: [
        //   "hightolow".tr,
        //   "lowtohigh".tr,
        // ]),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
          child: Text(
            "gender".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        // ChipsChoices(options: [
        //   "male".tr,
        //   "female".tr,
        // ]),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
          child: Text(
            "gender".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        // ChipsChoices(options: [
        //   "male".tr,
        //   "female".tr,
        // ]),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
          child: Text(
            "date".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        // ChipsChoices(options: [
        //   "new".tr,
        //   "old".tr,
        // ]),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: Dimensions.screenWidth(context),
            height: 40.h,
            margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            alignment: Alignment.center,
            decoration: AppButtons.buttonDecoration,
            child: Text(
              "confirm".tr,
              style: TextStyles.w50016White(context),
            ),
          ),
        ),
      ]),
    ),
  ));
  return Future.value(true);
}
