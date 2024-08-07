import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/profiles_controller/freelancer_profile_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/view/screens/profile/freelancer_profile/tab_bar_widgets.dart';
import 'package:joblance/view/screens/status_screen.dart';
import 'package:joblance/view/widgets/profile_tob_bar.dart';
import 'package:joblance/view/widgets/tab_bar.dart';

class FreelancerProfile extends StatelessWidget {
  final int id;
  const FreelancerProfile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(FreelancerProfileControllerImpl(id: id));
    return Scaffold(
      body: GetBuilder<FreelancerProfileControllerImpl>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? Container()
            : controller.statusRequest == StatusRequest.success
                ? DefaultTabController(
                    length: controller.tabs.length,
                    child: NestedScrollView(
                        headerSliverBuilder: (BuildContext context,
                                bool innerBoxIsScrolled) =>
                            [
                              SliverToBoxAdapter(
                                  child: Column(children: [
                                TobBar(
                                  image: controller.data['image'] != null
                                      ? controller.data['image']
                                      : "",
                                  name: controller.data['first_name'] +
                                      " " +
                                      controller.data['last_name'],
                                  description: controller.data['major']['name'],
                                  followers: controller.data['followers'],
                                ),
                                SizedBox(height: 10.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (controller.followed)
                                              controller.unFollowUser();
                                            else
                                              controller.followUser();
                                          },
                                          child: Container(
                                            height: 40.h,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                  width: 0.5),
                                              color: !controller.followed
                                                  ? LightAppColors.primaryColor
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .background,
                                            ),
                                            child: Text(
                                                !controller.followed
                                                    ? "follow".tr
                                                    : "unfollow".tr,
                                                style: TextStyles.w50013White(
                                                    context)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Expanded(
                                          flex: 1,
                                          child: Visibility(
                                            visible:
                                                !controller.data['evaluated'],
                                            child: GestureDetector(
                                              onTap: () async {
                                                var level = await rateDialog(
                                                    "ratethisfreelancer".tr,
                                                    context);

                                                controller.rateFreelancer(
                                                    level, context);
                                              },
                                              child: Container(
                                                height: 40.h,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSecondary)),
                                                child: Text("rate".tr,
                                                    style: TextStyles.w50012(
                                                        context)),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
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
                                )
                              ]))
                            ],
                        body: TabBarWidgets(
                          controller: controller,
                        )),
                  )
                : StatusScreen(statusRequest: controller.statusRequest),
      ),
    );
  }
}
