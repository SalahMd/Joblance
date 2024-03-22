import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class TabBarWidget extends StatelessWidget {
  final List<Widget> tabs;

  const TabBarWidget({Key? key, required this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Container(
        height: 55.0,
        child: TabBar(
          labelColor: LightAppColors.primaryColor,
          //isScrollable: true,
          labelPadding: EdgeInsets.zero,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3.w,
                color: LightAppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(15)),
          labelStyle: TextStyles.w50014(context),
          overlayColor: null,
          tabs: tabs,
        ),
      ),
    );
  }
}
