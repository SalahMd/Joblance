import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/task_design.dart';

class AcceptedTaskWidget extends StatelessWidget {
  const AcceptedTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth(context),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      padding: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "22 days left".tr,
              style:
                  TextStyle(color: LightAppColors.greenColor, fontSize: 15.sp),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: TaskDesign(
                taskTitle: "dawd",
                userName: "dadwa",
                major: "daawd",
                date: "12/2/2024",
                duration: '22',
                image:
                    "\/storage\/freelancer\/efExpDU1KUoIF2dzqaoblOHfqGZskVl4Djv2CLoD.jpg",
                isActive: true,
                aboutTask: "dawd wd wa dw wa",
                taskId: 2,
                id: 12),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 20.w, bottom: 5..h),
            child: Text(
              "you have been accepted in this task on 12-2-2024",
              style: TextStyles.w40011grey(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 20.w,
            ),
            child: Text(
              "offer information :",
              style: TextStyles.w40012grey(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 20.w,
            ),
            child: Text(
              "excutingtime".tr + ":" + " 22 days",
              style: TextStyles.w40011grey(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 20.w, bottom: 10..h),
            child: Text(
              "budget".tr + ":" + " 50\$",
              style: TextStyles.w40011grey(context),
            ),
          ),
        ],
      ),
    );
  }
}
