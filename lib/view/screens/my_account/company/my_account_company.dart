import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/my_account_controller/my_account_company_controller.dart';
import 'package:joblance/view/screens/my_account/company/company_tab_bar_view.dart';
import 'package:joblance/view/widgets/profile_tob_bar.dart';
import 'package:joblance/view/widgets/tab_bar.dart';

import '../../../../core/class/statusrequest.dart';

class MyAccountCompany extends StatelessWidget {
  const MyAccountCompany({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyAccountCompanyControllerImpl());
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2));
        controller.refreshPage();
      },
      child: Scaffold(
          body: GetBuilder<MyAccountCompanyControllerImpl>(
              builder: (controller) => controller.statusRequest ==
                      StatusRequest.loading
                  ? Container()
                  : DefaultTabController(
                      length: controller.tabs.length,
                      child: NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) => [
                          SliverToBoxAdapter(
                            child: Column(children: [
                              TobBar(
                                isMyAccount: true,
                                image: controller.data['image']!=null?controller.data['image']:"",
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
                            ]),
                          ),
                        ],
                        body: CompanyTabBarViewWidget(
                          controller: controller,
                        ),
                      ),
                    ))),
    );
  }
}
