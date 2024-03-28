import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/controller/add_job_controller.dart';
import 'package:joblance/core/functions/dimenesions.dart';

// ignore: must_be_immutable
class JobDropDown extends StatelessWidget {
  final String title;
  final List<DropdownMenuItem<String>> choices;
  final AddjobController controller;
  String elementValue;

  JobDropDown({
    super.key,
    required this.title,
    required this.choices,
    required this.elementValue,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10),
      height: 60.h,
      width: Dimensions.screenWidth(context),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
          borderRadius: BorderRadius.circular(20)),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(25),
        iconSize: 20,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        style: TextStyle(
            fontSize: 13.sp,
            color: Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.w500),
        underline: Container(),
        dropdownColor: Theme.of(context).colorScheme.primaryContainer,
        value: elementValue,
        icon: const Icon(Icons.arrow_downward),
        isExpanded: true,
        elevation: 8,
        onChanged: (String? value) {
          controller.updateDropDownValue(value, title);
        },
        items: choices,
      ),
    ).animate().fade(duration: (600.ms)).slideY(begin: -0.5);
  }
}
