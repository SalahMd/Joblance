import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:joblance/controller/freelancer_home_page_controller.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/task_design.dart';

class Tasks extends StatelessWidget {
  final FreelancerHomePageControllerImpl controller;
  const Tasks({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      width: Dimensions.screenWidth(context),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskDesign(
            taskTitle: controller.tasks[index].taskTitle!,
            userName: "Google",
            major: "Technology",
            date: controller.tasks[index].createdAt!,
            duration: controller.tasks[index].taskDuration.toString(),
            image: AppImages.google,
            isActive: true,
            aboutTask: controller.tasks[index].aboutTask!,
             taskId: controller.tasks[index].id!, id: controller.tasks[index].userId!,
          );
        },
      ),
    );
  }
}
