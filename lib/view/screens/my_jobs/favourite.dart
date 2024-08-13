import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/favourite_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/my_jobs/my_Jobs_tab_bar_view.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavouriteControllerImpl());
    return Scaffold(
      body: GetBuilder<FavouriteControllerImpl>(
        builder: (controller) => DefaultTabController(
          length: controller.tabs.length,
          child: SingleChildScrollView(
            child: Container(
              height: Dimensions.screenHeight(context),
              child: Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: SafeArea(
                        child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back)),
                        SizedBox(width: 10.w),
                        Text("favourite".tr,
                            style: Theme.of(context).textTheme.headlineLarge)
                      ],
                    )),
                  ),
                  Container(
                      child: TabBar(
                    tabs: controller.tabs,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: TextStyles.w50012(context),
                    indicatorWeight: 3,
                  )),
                  MyJobsTabBarView(
                    controller: controller,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
