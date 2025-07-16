import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MyDivider extends StatelessWidget {
   double? height = 5.h;
   MyDivider({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height,
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.grey,
        ),
        SizedBox(
          height: height,
        ),
      ],
    );
  }
}
