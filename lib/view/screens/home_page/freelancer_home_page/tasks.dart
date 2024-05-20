import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/task_design.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      width: Dimensions.screenWidth(context),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return TaskDesign(
              taskTitle: "Mobile app",
              userName: "Google",
              major: "Technology",
              date: "2 days ago",
              duration: "1 month",
              image: AppImages.google,
              isActive: true);
        },
      ),
    );
  }
}
