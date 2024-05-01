import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/view/widgets/shimmer_item.dart';

class ConversationShimmer extends StatelessWidget {
  const ConversationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ShimmerItem(width: 50, height: 50),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 5.w),
                  child: ShimmerItem(
                    width: 100.w,
                    height: 10.h,
                  ),
                ),
                SizedBox(height: 10.h),
                ShimmerItem(width: 60.w, height: 7.h),
              ]))
        ]));
  }
}
