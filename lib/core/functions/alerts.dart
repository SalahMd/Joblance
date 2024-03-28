import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/text_styles.dart';

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
  return Future.value(true);
}

Future<bool> animationedAlertWithActions(
    var animation, String title, void Function() onYesTap) {
  Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
      titlePadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      content: animation != null
          ? Container(
              alignment: Alignment.topCenter, height: 100.h, child: animation)
          : null,
      barrierDismissible: false,
      actions: [
        TextButton(
            onPressed: () {
              onYesTap;
            },
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

normalAlert(String text) {
  Get.defaultDialog(
    title: text,
    middleText: "",
    titleStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
    titlePadding: EdgeInsets.only(top: 60),
    barrierDismissible: true,
  );
  return Future.value(true);
}

Future<bool> animationedAlert(var animation, String title) {
  Get.defaultDialog(
    title: title,
    titleStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
    //middleText: title,
    //middleTextStyle:TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w500),
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
  Get.snackbar(
    title,
    message,
    duration: const Duration(seconds: 5),
    titleText: Text(
      title,
      style: TextStyles.w50012(context),
    ),
    padding: EdgeInsets.only(bottom: 15.h, left: 10.w, right: 10.w),
    messageText: Text(
      message,
      style: TextStyles.w50013(context),
    ),
    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.only(bottom: 10.h)
  );
}
// alert(String title) {
//   Get.defaultDialog(
//     title: title,
//     titleStyle: TextStyles.bold16,
//     titlePadding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
//   );
// }

// Future<bool> alertWithActions(String title,void Function ()onYesTap) {
//   Get.defaultDialog(
//       title: "",
//       middleText: title,
//       middleTextStyle: TextStyles.bold16,
//       actions: [
//         TextButton(
//           onPressed:onYesTap,
//           child: Text(
//             "yes".tr,
//             style: const TextStyle(color: Colors.blue),
//           ),
//         ),
//         TextButton(
//             onPressed: () {
//               Get.back();
//             },
//             child: Text(
//               "no".tr,
//               style: const TextStyle(color: Colors.blue),
//             ))
//       ]);
//   return Future.value(false);
// }

// Future<bool> popUp(
//   BuildContext context,
// ) {
//   Get.bottomSheet(Container(
//     width: Dimensions.screenwidth(context),
//     height: 600.h,
//     decoration: BoxDecoration(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(25),
//           topRight: Radius.circular(25),
//         ),
//         color: Theme.of(context).colorScheme.primaryContainer),
//     child: SingleChildScrollView(
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         GestureDetector(
//             onTap: () {
//               Get.back();
//             },
//             child: Align(
//               alignment: Alignment.center,
//               child: Container(
//                 width: 60.w,
//                 height: 8.h,
//                 margin: const EdgeInsets.symmetric(vertical: 20),
//                 decoration: BoxDecoration(
//                     color: lightAppColors.greyColor,
//                     borderRadius: BorderRadius.circular(50)),
//               ),
//             )),
//         Padding(
//           padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
//           child: Text(
//             "filter".tr,
//             style: TextStyles.bold17,
//           ),
//         ),
//         SizedBox(height: 20.h),
//         Padding(
//           padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
//           child: Text(
//             "categories".tr,
//             style: TextStyles.w50018,
//           ),
//         ),
//         ChipsChoices(options: [
//           "apartments".tr,
//           "offices".tr,
//           "clinics".tr,
//           "properties".tr
//         ]),
//         //SizedBox(height:10.h),
//         Padding(
//           padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
//           child: Text(
//             "rentorsale".tr,
//             style: TextStyles.w50018,
//           ),
//         ),
//         ChipsChoices(options: [
//           "rent".tr,
//           "sale".tr,
//         ]),
//         Padding(
//           padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
//           child: Text(
//             "price".tr,
//             style: TextStyles.w50018,
//           ),
//         ),
//         ChipsChoices(options: [
//           "expensive".tr,
//           "medium".tr,
//           "cheap".tr,
//         ]),
//         Padding(
//           padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
//           child: Text(
//             "space".tr,
//             style: TextStyles.w50018,
//           ),
//         ),
//         ChipsChoices(options: [
//           "more100m".tr,
//           "less100m".tr,
//           "more200m".tr,
//         ]),
//         InkWell(
//           onTap: () {
//             //controller.logIn();
//             Get.back();
//           },
//           child: Container(
//             width: Dimensions.screenwidth(context),
//             height: 40.h,
//             margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
//             alignment: Alignment.center,
//             decoration: AppButtons.decorationButton,
//             child: Text(
//               "confirm".tr,
//               style: TextStyles.w50015White,
//             ),
//           ),
//         ),
//       ]),
//     ),
//   ));
//   return Future.value(true);
// }
