import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class TaskAndJobTobBar extends StatelessWidget {
  final bool isOwner;
  final void Function() onTap;
  final void Function()? onDelete;
  const TaskAndJobTobBar(
      {super.key, required this.isOwner, required this.onTap, this.onDelete});

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
            Row(
              children: [
                isOwner
                    ? GestureDetector(
                        onTap: () {
                          onDelete!();
                        },
                        child: Container(
                            width: 35.w,
                            height: 40.h,
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.h, vertical: 10.h),
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red[800],
                              size: 19.sp,
                            )),
                      )
                    : Container(),
                Visibility(
                  visible: isOwner,
                  child: GestureDetector(
                    onTap: () {
                      onTap();
                    },
                    child: Container(
                        width: 35.w,
                        height: 40.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.h, vertical: 10.h),
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.edit,
                          color: LightAppColors.primaryColor,
                          size: 19.sp,
                        )),
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
