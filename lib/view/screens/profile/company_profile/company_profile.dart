import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/profiles_controller/company_profile_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/add_review.dart';
import 'package:joblance/view/screens/profile/company_profile/company_tab_bar.dart';
import 'package:joblance/view/widgets/profile_tob_bar.dart';
import 'package:joblance/view/widgets/tab_bar.dart';

class CompanyProfile extends StatelessWidget {
  final int id;
  const CompanyProfile({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CompanyProfileControllerImpl(id: id));
    return Scaffold(
        body: GetBuilder<CompanyProfileControllerImpl>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? Container()
          : DefaultTabController(
              length: controller.tabs.length,
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) => [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TobBar(
                          image: controller.data['image'],
                          name: controller.data['name'],
                          description: controller.data['major'],
                           followers: controller.data['followers'],
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: 40.h,
                                alignment: Alignment.center,
                                decoration: AppButtons.buttonDecoration,
                                child: Text("follow".tr,
                                    style: TextStyles.w50013White(context)),
                              )),
                              SizedBox(width: 10.w),
                              Expanded(
                                  child: GestureDetector(
                                onTap: () {
                                  Get.to(AddReview(id:controller.data['id'],image: controller.data['image'],name: controller.data['name'],));
                                },
                                child: Container(
                                  height: 40.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary)),
                                  child: Text("review".tr,
                                      style: TextStyles.w50012(context)),
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
                        ),
                      ],
                    ),
                  ),
                ],
                body: CompanyTabBar(
                  controller: controller,
                ),
              ),
            ),
    ));
  }
}
