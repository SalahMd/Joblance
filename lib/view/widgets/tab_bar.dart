import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';

class TabBarWidget extends StatelessWidget {
  TabBarWidget({super.key, this.controller, required this.tabs});
  final List <Widget>tabs;
  var controller;
  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: controller,
        labelColor: LightAppColors.primaryColor,
        unselectedLabelColor: LightAppColors.greyColor,
        isScrollable: true,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 3.w,
              color: LightAppColors.primaryColor,
            ),
            insets: EdgeInsets.symmetric(horizontal: 15.w)),
        labelStyle: TextStyles.w50012(context),
        labelPadding: EdgeInsets.symmetric(horizontal: 15.w),
        tabs: tabs);
  }
}
