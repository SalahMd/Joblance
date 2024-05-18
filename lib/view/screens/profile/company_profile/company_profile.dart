import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/profiles_controller/company_profile_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
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
