import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/my_account_controller/my_account_free_lancer_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/view/screens/my_account/freelancer/tab_bar_view_widgets.dart';
import 'package:joblance/view/screens/status_screen.dart';
import 'package:joblance/view/widgets/profile_tob_bar.dart';
import 'package:joblance/view/widgets/tab_bar.dart';

class MyAccountFreeLancer extends StatelessWidget {
  const MyAccountFreeLancer({super.key, });

  @override
  Widget build(BuildContext context) {
    Get.put(MyAccountFreelancerControllerImpl());
    return Scaffold(
        body: GetBuilder<MyAccountFreelancerControllerImpl>(
            builder: (controller) => controller.statusRequest ==
                    StatusRequest.loading
                ? Container()
                  : controller.statusRequest == StatusRequest.success
                    ? 
               DefaultTabController(
                    length: controller.tabs.length,
                    child: NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) => [
                                  SliverToBoxAdapter(
                                    child: Column(
                                      children: [
                                        TobBar(
                                          isMyAccount: true,
                                          image:
                                              controller.data['image'] != null
                                                  ? controller.data['image']
                                                  : "",
                                          name: controller.data['first_name'] +
                                              " " +
                                              controller.data['last_name'],
                                          description: controller.data['major']['name'],
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Divider(
                                          height: 1,
                                          thickness: 0.5,
                                        ),
                                        TabBarWidget(
                                          tabs: controller.tabs,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                        body: TabBarViewWidgets(
                          controller: controller,
                        )),
                  ) : StatusScreen(statusRequest: controller.statusRequest),));
  }
}
