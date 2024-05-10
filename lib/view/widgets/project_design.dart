import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/project_screen.dart';

class ProjectDesign extends StatelessWidget {
  final String projectTitle;
  final String projectDescription;
  final String projectMedia;
  final String projectLink;
  const ProjectDesign(
      {super.key,
      required this.projectTitle,
      required this.projectDescription,
      required this.projectMedia,
      required this.projectLink});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProjectScreen(userId: 1,projectId: 1,));
      },
      child: Container(
        width: Dimensions.screenWidth(context),
        height: 160.h,
        margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              projectTitle,
              style: TextStyles.w50015(context),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              projectDescription,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.w40012grey(context),
            ),
            SizedBox(height: 5.h),
            GestureDetector(
              child: Row(
                children: [
                  Text(
                    projectLink,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.blue, fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "showmore".tr,
                    style: TextStyles.w40010grey(context),
                  ),
                  Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 22.sp,
                    color: LightAppColors.primaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
