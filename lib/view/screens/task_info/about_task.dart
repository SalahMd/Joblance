import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class AbouTask extends StatelessWidget {
  final String aboutTask;
  const AbouTask({super.key, required this.aboutTask});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Dimensions.screenWidth(context),
          height: 40.h,
          alignment: AlignmentDirectional.centerStart,
          margin: EdgeInsets.symmetric(vertical: 10.h),
          padding: EdgeInsetsDirectional.only(
            start: 10.w,
          ),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          child: Text(
            "abouttask".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        Container(
          width: Dimensions.screenWidth(context),
          margin: EdgeInsets.symmetric(
            horizontal: 5.h,
          ),
          decoration: BoxDecoration(
              // color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                aboutTask,
                style: TextStyles.w40012grey(context),
              )
            ],
          ),
        ),
      ],
    );
  }
}
