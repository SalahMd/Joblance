import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/auth/signup_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

// ignore: must_be_immutable
class DropDownWidget extends StatelessWidget {
  final String title;
  final List<DropdownMenuItem<String>> choices;
  final SignUpControllerImpl controller;
  String elementValue;

  DropDownWidget({
    super.key,
    required this.title,
    required this.choices,
    required this.elementValue,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      height: 60.h,
      width: Dimensions.screenwidth(context),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(25)),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(25),
        iconSize: 20,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        style: TextStyle(fontSize: 14.sp, color: Colors.black),
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
