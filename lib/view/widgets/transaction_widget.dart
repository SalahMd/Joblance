import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';

class TransactionWidget extends StatelessWidget {
  final String date;
  final String value;
  final String transName;
  final int transId;
  const TransactionWidget(
      {super.key,
      required this.date,
      required this.value,
      required this.transName, required this.transId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(8)),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transName,
              style: TextStyles.w50014(context),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "on".tr,
                  style: TextStyles.w50012(context),
                ),
                Text(
                  Jiffy.parse(date).fromNow().toString(),
                  style: TextStyles.w40011grey(context),
                )
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "value".tr,
                  style: TextStyles.w50012(context),
                ),
                Text(
                  value + " \$",
                  style: TextStyle(
                    color:transId==3?Colors.red[800] :LightAppColors.greenColor,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
