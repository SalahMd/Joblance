import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/my_account_controller/my_account_free_lancer_controller.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/my_account/freelancer/tab_bar_view_widgets.dart';
import 'package:joblance/view/widgets/profile_tob_bar.dart';
import 'package:joblance/view/widgets/tab_bar.dart';

class MyAccountFreeLancer extends StatelessWidget {
  const MyAccountFreeLancer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyAccountFreelancerControllerImpl());
    return Scaffold(
        body: GetBuilder<MyAccountFreelancerControllerImpl>(
            builder: (controller) => DefaultTabController(
                  length: controller.tabs.length,
                  child: NestedScrollView(
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) => [
                                SliverToBoxAdapter(
                                  child: Column(
                                    children: [
                                      TobBar(
                                        isMyAccount: true,
                                        image: AppImages.salah,
                                        name: "Salah Mdaghmesh",
                                        description: "IT developer",
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
                                // SliverAppBar(
                                //   pinned: true,
                                //   floating: true,
                                //   automaticallyImplyLeading: false,
                                //   bottom:
                                // ),
                              ],
                      body: TabBarViewWidgets(
                        controller: controller,
                      )),
                ))

        // body: GetBuilder<MyAccountFreelancerControllerImpl>(
        //   builder: (controller) => DefaultTabController(
        //     length: controller.tabs.length,
        //     child: SingleChildScrollView(
        //       child: Column(
        //         //mainAxisSize: MainAxisSize.min,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           TobBar(
        //             isMyAccount: true,
        //             image: AppImages.salah,
        //             name: "Salah Mdaghmesh",
        //             description: "IT developer",
        //           ),
        //           SizedBox(
        //             height: 15.h,
        //           ),
        //           Divider(
        //             height: 1,
        //             thickness: 0.5,
        //           ),
        //           TabBarWidget(
        //             tabs: controller.tabs,
        //           ),
        //           TabBarViewWidgets(controller: controller,)
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
