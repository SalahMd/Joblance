import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/data/model/task_model.dart';
import 'package:joblance/view/widgets/task_design.dart';

class AcceptedTaskWidget extends StatelessWidget {
  final String duration;
  final TaskModel task;
  const AcceptedTaskWidget(
      {super.key, required this.duration, required this.task});

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
              duration + " daysleft".tr,
              style:
                  TextStyle(color: LightAppColors.greenColor, fontSize: 15.sp),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: TaskDesign(
                taskTitle: task.taskTitle!,
                userName: task.name!,
                major: task.majorName!,
                date: task.createdAt!,
                duration: task.taskDuration.toString(),
                image: task.image!,
                isActive: task.active == 1 ? true : false,
                aboutTask: task.aboutTask!,
                taskId: task.id!,
                id: task.userId!),
          ),
          // Padding(
          //   padding: EdgeInsetsDirectional.only(start: 20.w, bottom: 5..h),
          //   child: Text(
          //     "you have been accepted in this task on 12-2-2024",
          //     style: TextStyles.w40011grey(context),
          //   ),
          // ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 20.w,
            ),
            child: Text(
              "offerinformation:".tr,
              style: TextStyles.w40012grey(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 20.w,
            ),
            child: Text(
              "excutingtime".tr + ":" + duration + " days".tr,
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
