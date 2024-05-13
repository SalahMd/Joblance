import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/links.dart';

class ImageView extends StatelessWidget {
  final String image;
  const ImageView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
      ),
      body: Center(
        child: Image.network(
          image[0] == "h" ? image : AppLinks.IP + "/" + image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
