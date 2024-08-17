import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/search_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/search/filters.dart';
import 'package:joblance/view/screens/search/search_tab_bar.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchControllerImpl());
    return GetBuilder<SearchControllerImpl>(
      builder: (controller) => Scaffold(
          body: DefaultTabController(
        length: controller.tabs.length,
        child: Column(children: [
          SafeArea(
            child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                width: Dimensions.screenWidth(context),
                height: 60,
                child: TextFormField(
                  controller: controller.search,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 15.sp),
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        if (controller.index == 1) {
                          controller.searchJobs(false);
                        } else if (controller.index == 0 &&
                            controller.role == "1") {
                          controller.searchFreelancers();
                        } else {
                          controller.searchTasks();
                        }
                      },
                      child: const Icon(
                        Icons.search,
                        size: 25,
                      ),
                    ),
                    prefixIcon: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 25,
                      ),
                    ),
                    enabled: true,
                    hintText: "search".tr,
                    hintStyle: TextStyle(fontSize: 14.sp),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.only(
                        left: 20, right: 5, top: 15, bottom: 15),
                  ),
                )),
          ),
          Container(
              child: TabBar(
            isScrollable: false,
            tabs: controller.tabs,
            indicatorSize: TabBarIndicatorSize.label,
            onTap: (i) {
              controller.index = i;
              print(i);
            },
            labelStyle: TextStyles.w50012(context),
            indicatorWeight: 3,
          )),
          Filters(
            controller: controller,
          ),
          SearchTabBar(
            controller: controller,
          ),
        ]),
      )),
    );
  }
}
