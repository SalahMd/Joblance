import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class Requirements extends StatelessWidget {
  final String requirements;
  const Requirements({super.key, required this.requirements});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Dimensions.screenWidth(context),
          height: 50.h,
          alignment: AlignmentDirectional.centerStart,
          margin: EdgeInsets.symmetric(vertical: 20.h),
          padding: EdgeInsetsDirectional.only(
            start: 10.w,
          ),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          child: Text(
            "requirments".tr,
            style: TextStyles.w50014(context),
          ),
        ),
        Container(
          width: Dimensions.screenWidth(context),
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          padding: EdgeInsets.symmetric(
            vertical: 3.h,
          ),
          child: Text(
            requirements,
            style: TextStyles.w40012grey(context),
          ),
        ),
      ],
    );
  }
}
