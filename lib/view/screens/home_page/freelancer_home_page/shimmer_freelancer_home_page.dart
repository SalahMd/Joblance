import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/shimmer_item.dart';
import 'package:joblance/view/widgets/shimmer_job_design.dart';

class ShimmerFreelancerHomePage extends StatelessWidget {
  const ShimmerFreelancerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          SafeArea(
            child: Row(
              children: [
                ShimmerItem(width: 40.w, height: 45.h),
                ShimmerItem(width: 100.w, height: 20.h),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          ShimmerItem(width: Dimensions.screenWidth(context), height: 50.h),
          SizedBox(
            height: 20.h,
          ),
          ShimmerItem(width: 120, height: 25.h),
          SizedBox(
            height: 20.h,
          ),
          ShimmerItem(width: Dimensions.screenWidth(context), height: 185.h),
          SizedBox(
            height: 20.h,
          ),
          ShimmerItem(width: 80.w, height: 25.h),
          SizedBox(
            height: 20.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ShimmerItem(width: 95, height: 90.h),
                ShimmerItem(width: 95, height: 90.h),
                ShimmerItem(width: 95, height: 90.h),
                ShimmerItem(width: 95, height: 90.h),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ShimmerItem(width: 110.w, height: 25.h),
          SizedBox(
            height: 20.h,
          ),
          ShimmerJobDesign(),
          ShimmerJobDesign(),
          ShimmerJobDesign(),
        ],
      ),
    );
  }
}
