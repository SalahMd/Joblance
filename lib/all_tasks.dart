import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/all_tasks_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/widgets/task_design.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllTasksControllerImpl());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back)),
                SizedBox(width: 10.w),
                Text(
                  "alltasks".tr,
                  style: TextStyles.w50019(context),
                ),
              ]),
            )),
            SizedBox(height: 10.h),
            GetBuilder<AllTasksControllerImpl>(
              builder: (controller) => ListView.builder(
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
                    isActive:
                        controller.tasks[index].active == 1 ? true : false,
                    aboutTask: controller.tasks[index].aboutTask!,
                    taskId: controller.tasks[index].id!,
                    id: controller.tasks[index].userId!,
                    isFavourite: controller.tasks[index].isFavourite,
                    onFavouriteTap: () {
                      controller.addRemoveFavourite(
                          controller.tasks[index].id!, index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
