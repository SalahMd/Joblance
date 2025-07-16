import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class AdditionalInfo extends StatelessWidget {
  final String? additionalInfo;
  const AdditionalInfo({super.key, required this.additionalInfo});

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
            "additionalinfo".tr,
            style: TextStyles.w50014(context),
          ),
        ),
        Container(
          width: Dimensions.screenWidth(context),
          margin: EdgeInsets.symmetric(
            horizontal: 5.h,
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Text(
            additionalInfo!,
            style: TextStyles.w40012grey(context),
          ),
        ),
      ],
    );
  }
}
