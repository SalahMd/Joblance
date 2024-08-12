import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/widgets/accepted_task_widget.dart';

class AcceptedTasks extends StatelessWidget {
  const AcceptedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back)),
                SizedBox(width: 10.w),
                Text(
                  "acceptedtasks".tr,
                  style: TextStyles.w50019(context),
                ),
              ]),
            )),
            SizedBox(height: 20.h),
            AcceptedTaskWidget()
          ],
        ),
      ),
    );
  }
}
