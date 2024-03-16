import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class NotificationDesign extends StatelessWidget {
  final image;
  final String name;
  final String notificationBody;
  final String notificationDate;

  const NotificationDesign({
    super.key,
    required this.image,
    required this.name,
    required this.notificationBody,
    required this.notificationDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      width: Dimensions.screenwidth(context),
      color: Theme.of(context).colorScheme.primaryContainer,
      height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            margin: EdgeInsets.symmetric(vertical: 15.h),
            alignment: AlignmentDirectional.centerStart,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            // Wrap the Column with Expanded
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name + " ",
                  style: TextStyles.w50014(context),
                ),
                Text(
                  notificationBody,
                  style: TextStyles.w40011grey(context),
                ),
                Text(
                  notificationDate,
                  style: TextStyles.w40011grey(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
