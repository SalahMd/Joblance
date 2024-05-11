import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/project_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDesign extends StatelessWidget {
  final String projectTitle;
  final String projectDescription;
  final int project_id;
  final int user_id;
  final String projectLink;
  const ProjectDesign(
      {super.key,
      required this.projectTitle,
      required this.projectDescription,
      required this.projectLink,
      required this.project_id,
      required this.user_id});

  @override
  Widget build(BuildContext context) {
    Future<void> url() async {
      try {
        await launchUrl(Uri.parse(projectLink));
      } catch (_) {
        animationedAlert(AppAnimations.wrong, "couldn'topenlink".tr);
      }
    }

    return GestureDetector(
      onTap: () {
        Get.to(ProjectScreen(
          userId: user_id,
          projectId: project_id,
        ));
      },
      child: Container(
        width: Dimensions.screenWidth(context),
        // height: 160.h,
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
              style: TextStyles.w50014(context),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              projectDescription,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.w40011grey(context),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: url,
                    child: Text(
                      projectLink,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.blue, fontSize: 11.sp),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8.h),
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
