import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/task_page_controller.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/view/screens/job_info/additiona_info.dart';
import 'package:joblance/view/screens/job_info/requirments.dart';
import 'package:joblance/view/screens/task_info/about_task.dart';
import 'package:joblance/view/screens/task_info/top_bar.dart';

class TaskPage extends StatelessWidget {
  final int taskId, id;
  const TaskPage({super.key, required this.taskId, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPageControllerImpl(context, taskId: taskId, id: id));
    return Scaffold(
      body: GetBuilder<TaskPageControllerImpl>(
        builder: (controller) => SingleChildScrollView(
          child: Form(
            key: controller.formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TaskTobBar(
                    userImage: Image.asset(AppImages.google),
                    userName: controller.task.name!,
                    taskTitle: controller.task.taskTitle!,
                    major: "Technology",
                    isActive: true,
                    onTap: controller.updateTask,
                    isOwner: controller.isOwner,
                    budget: controller.task.budgetMin.toString()+"-"+controller.task.budgetMax.toString(),
                    id: controller.task.id!,
                    duration: controller.task.taskDuration.toString()),
                SizedBox(
                  height: 5.h,
                ),
                AbouTask(aboutTask: controller.task.aboutTask!,),
                Requirements(requirements: controller.task.requirements!,),
                AdditionalInfo(additionalInfo: controller.task.additionalInformation!,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
