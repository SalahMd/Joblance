import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer/shimmer.dart';

class ShimmerItem extends StatelessWidget {
  ShimmerItem({super.key, required this.width, required this.height});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[400]!,

        highlightColor: Colors.grey[100]!,
        child: Container(
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.symmetric(horizontal: 8),
          width: width.w,
          height: height.h,
          
        ));
  }
}
