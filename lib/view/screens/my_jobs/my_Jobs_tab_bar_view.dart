import 'package:flutter/material.dart';
import 'package:joblance/controller/my_jobs_controller.dart';
import 'package:joblance/view/widgets/job_design.dart';
import 'package:joblance/view/widgets/task_design.dart';

class MyJobsTabBarView extends StatelessWidget {
  final MyJobsControllerImpl controller;
  const MyJobsTabBarView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(children: [
        favouriteJobs(context, controller),
        favouriteTasks(context, controller)
      ]),
    );
  }
}

Widget favouriteJobs(BuildContext context, MyJobsControllerImpl controller) {
  return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.jobs.length,
      itemBuilder: (BuildContext context, int index) {
        return JobDesign(
          jobTitle: controller.jobs[index].jobTitle!,
          companyName: controller.jobs[index].companyName!,
          location: controller.jobs[index].location,
          date: controller.jobs[index].date!,
          remote: controller.jobs[index].remoteName!,
          jobId: controller.jobs[index].id!,
          image: controller.jobs[index].companyImage!,
          companyId: controller.jobs[index].companyId!,
          isActive: controller.jobs[index].active == 1 ? true : false,
          isFavourite: controller.jobs[index].isFavorite!,
          onFavouriteTap: () {
            controller.addRemoveFavourite(
                controller.jobs[index].id!, false, index);
          },
        );
      });
}

Widget favouriteTasks(BuildContext context, MyJobsControllerImpl controller) {
  return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
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
            controller.addRemoveFavourite(
                controller.tasks[index].id!, true, index);
          },
        );
      });
}
