import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class JobTobBar extends StatelessWidget {
  final bool isOwner;
  final void Function() onTap;
  const JobTobBar({super.key, required this.isOwner, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: Dimensions.screenWidth(context),
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(Icons.arrow_back),
              ),
            ),
            GestureDetector(
              onTap: () {onTap();},
              child: Container(
                  width: 35.w,
                  height: 40.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20)),
                  child: isOwner
                      ? Icon(
                          Icons.edit,
                          color: LightAppColors.primaryColor,
                          size: 19.sp,
                        )
                      : Image.asset(
                          AppImages.save,
                          color: Theme.of(context).colorScheme.onSecondary,
                          fit: BoxFit.fill,
                        )),
            )
          ],
        ),
      ),
    );
  }
}
