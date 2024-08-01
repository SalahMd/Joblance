import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:joblance/controller/freelancer_home_page_controller.dart';
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
            userName: controller.tasks[index].name!,
            major: controller.tasks[index].majorName!,
            date: controller.tasks[index].createdAt!,
            duration: controller.tasks[index].taskDuration.toString(),
            image: controller.tasks[index].image!,
            isActive: controller.tasks[index].active == 1 ? true : false,
            aboutTask: controller.tasks[index].aboutTask!,
            taskId: controller.tasks[index].id!,
            id: controller.tasks[index].userId!,
            isFavourite: controller.tasks[index].isFavourite,
            onFavouriteTap: () {
              controller.addRemoveFavourite(controller.tasks[index].id!, true);
            },
          );
        },
      ),
    );
  }
}
