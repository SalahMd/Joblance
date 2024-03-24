import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/profiles_controller/freelancer_profile_controller.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/view/screens/profile/tob_bar.dart';
import 'package:joblance/view/widgets/divider.dart';
import 'package:joblance/view/widgets/tab_bar.dart';

class FreelancerProfile extends StatelessWidget {
  const FreelancerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FreelancerProfileControllerImpl());
    return WillPopScope(
      onWillPop: exitAlert,
      child: Scaffold(
        body: GetBuilder<FreelancerProfileControllerImpl>(
          builder: (controller) => DefaultTabController(
            length: controller.tabs.length,
            child: SingleChildScrollView(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(fit: FlexFit.loose, child: TobBar()),
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
                SizedBox(
                  height: 400.h,
                  child: TabBarView(children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "bio".tr,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Expanded(
                            child: Text(
                              "A junior flutter developer in the third year of Damascus university, with 2 years of expirence in developing apps."
                                  .tr,
                              style: TextStyles.w40014grey(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [Text("")],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [Text("")],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "contactinfo".tr,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_outlined),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "+963996541809",
                                style: TextStyles.w50013(context),
                              )
                            ],
                          ),
                          MyDivider(
                            height: 10,
                          ),
                          Row(children: [
                            Icon(Icons.mail_outlined),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Text(
                                "salahaldeenmdaghmesh@gmail.com",
                                style: TextStyles.w50013(context),
                              ),
                            ),
                          ]),
                          MyDivider(
                            height: 10,
                          ),
                          Row(children: [
                            Icon(Icons.link_outlined),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Text(
                                "www.google.com",
                                style: TextStyles.w50013(context),
                              ),
                            )
                          ])
                        ],
                      ),
                    )
                  ]),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
