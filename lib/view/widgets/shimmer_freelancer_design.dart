import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/shimmer_item.dart';

class ShimmerFreelancerDesign extends StatelessWidget {
  const ShimmerFreelancerDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Dimensions.screenWidth(context),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ShimmerItem(
                  width: 35,
                  height: 40,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerItem(width: 90.w, height: 15.h),
                    SizedBox(height: 5.h),
                    ShimmerItem(width: 70.w, height: 15.h)
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            ShimmerItem(width: 200.w, height: 13.h),
            SizedBox(height: 5.h),
            ShimmerItem(width: 200.w, height: 13.h),
            SizedBox(height: 10.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerItem(width: 50.w, height: 10.h),
                  ShimmerItem(width: 50.w, height: 10.h),
                ],
              ),
            )
          ],
        ));
  }
}
