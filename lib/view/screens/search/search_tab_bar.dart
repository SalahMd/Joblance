import 'package:flutter/material.dart';
import 'package:joblance/controller/search_controller.dart';
import 'package:joblance/view/widgets/freelancer_design.dart';
import 'package:joblance/view/widgets/job_design.dart';
import 'package:joblance/view/widgets/task_design.dart';

class SearchTabBar extends StatelessWidget {
  final SearchControllerImpl controller;
  const SearchTabBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: controller.role == "1"
          ? TabBarView(children: [
              freelancers(context, controller),
              jobs(context, controller),
            ])
          : TabBarView(children: [
              tasks(context, controller),
              jobs(context, controller),
            ]),
    );
  }
}

Widget freelancers(BuildContext context, SearchControllerImpl controller) {
  return ListView.builder(
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: controller.freelancers.length,
    itemBuilder: (BuildContext context, int index) {
      return FreeLancerDesign(
        name: controller.freelancers[index]['first_name'] +
            " " +
            controller.freelancers[index]['last_name'],
        bio: controller.freelancers[index]['bio'],
        location: controller.freelancers[index]['location'],
        image: controller.freelancers[index]['image'],
        major: controller.freelancers[index]['major']['name'],
        openToWork: controller.freelancers[index]['open_to_work'],
        id: controller.freelancers[index]['id'],
        rateLevel: controller.freelancers[index]['rate'],
        numOfRates: controller.freelancers[index]['counter'],
        followers: controller.freelancers[index]['followers'],
        onFavoriteTap: () {
          // controller.RemoveFreelancer(
          //     controller.freelancers[index]['id'], index, context);
        },
        isFavorite: controller.freelancers[index]['favourited'],
      );
    },
  );
}

Widget jobs(BuildContext context, SearchControllerImpl controller) {
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
          //isFavourite: controller.jobs[index].isFavorite!,
          // onFavouriteTap: () {
          //   controller.RemoveFavourite(
          //       controller.jobs[index].id!, false, index);
          // },
        );
      });
}

Widget tasks(BuildContext context, SearchControllerImpl controller) {
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
          // isFavourite: controller.tasks[index].isFavourite,
          // onFavouriteTap: () {
          //   controller.RemoveFavourite(
          //       controller.tasks[index].id!, true, index);
          // },
        );
      });
}
