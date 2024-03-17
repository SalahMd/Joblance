import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/shimmer_item.dart';

class ShimmerJobDesign extends StatelessWidget {
  const ShimmerJobDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth(context),
      height: 120.h,
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      margin: EdgeInsets.symmetric(horizontal: 7.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          ShimmerItem(
            width: 40.w,
            height: 50.h,
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerItem(width: 100.w, height: 15.h),
              SizedBox(height: 5.h),
              ShimmerItem(width: 70.w, height: 15.h),
              SizedBox(height: 5.h),
              ShimmerItem(width: 40.w, height: 10.h),
              SizedBox(height: 5.h),
              ShimmerItem(width: 40.w, height: 8.h),
            ],
          )
        ],
      ),
    );
  }
}
