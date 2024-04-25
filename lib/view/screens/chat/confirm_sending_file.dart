import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/texting_page_controller.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class ConfirmSendingFile extends GetView<TextingPageControllerImpl> {
  const ConfirmSendingFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.file_copy_outlined,
              color: Colors.red[800],
              size: 100.sp,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              controller.fileName!,
              style: TextStyles.w50015(context),
            ),
            SizedBox(height: 80.h),
            GestureDetector(
              onTap: () {
                controller.sendFile();
              },
              child: Container(
                width: Dimensions.screenWidth(context),
                height: 35.h,
                margin: EdgeInsets.symmetric(horizontal: 60.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: LightAppColors.greenColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "send".tr,
                  style: TextStyles.w50016White(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
