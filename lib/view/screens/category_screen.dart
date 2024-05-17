import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/chips_choice.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  final int id;
  final String name;
  List<String> filters = [
    "civvilian",
    "architicture",
    "electronic",
    "electrcity"
  ];
  CategoryScreen({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                  child: Text(
                    name,
                    style: TextStyles.w50017(context),
                  )),
            ),
            Divider(
              thickness: 0.4,
              height: 1.h,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            Container(
              width: Dimensions.screenWidth(context),
              height: 60.h,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, int index) {
                    return ChipsChoices(
                      options: filters,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
