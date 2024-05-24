import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/view/screens/job_info/additiona_info.dart';
import 'package:joblance/view/screens/job_info/requirments.dart';
import 'package:joblance/view/screens/task_info/about_task.dart';
import 'package:joblance/view/screens/task_info/top_bar.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TaskTobBar(
                userImage: Image.asset(AppImages.google),
                userName: "Google",
                taskTitle: "Mobile app",
                major: "Technology",
                isActive: true,
                budget: "200-500",
                id:3,
                duration: "60 days"),
            SizedBox(
              height: 5.h,
            ),
            AbouTask(),
            Requirements(),
            AdditionalInfo()
          ],
        ),
      ),
    );
  }
}
