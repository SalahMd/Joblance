import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/profiles_controller/company_profile_controller.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/profile/tob_bar.dart';
import 'package:joblance/view/widgets/divider.dart';
import 'package:joblance/view/widgets/job_design.dart';
import 'package:joblance/view/widgets/tab_bar.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CompanyProfileControllerImpl());
    return Scaffold(
      body: GetBuilder<CompanyProfileControllerImpl>(
        builder: (controller) => DefaultTabController(
          length: controller.tabs.length,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TobBar(),
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
                Container(
                  width: Dimensions.screenWidth(context),
                  height: Dimensions.screenHeight(context),
                  child: TabBarView(children: [
                   Container(
                       child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Padding(
                         padding: EdgeInsets.symmetric(
                             horizontal: 20.w, vertical: 20.h),
                         child: Text(
                           "postedjobs".tr,
                           style: Theme.of(context).textTheme.headline1,
                         ),
                       ),
                       ListView.builder(
                           padding: EdgeInsets.zero,
                           shrinkWrap: true,
                           physics: const NeverScrollableScrollPhysics(),
                           itemCount: 6,
                           itemBuilder: (BuildContext context, int index) {
                             return JobDesign(
                                 jobTitle: "React developer",
                                 companyName: "Google",
                                 location: "United states",
                                 date: "9 days ago",
                                 remote: "remote".tr,
                                 image: AppImages.googleLogo,
                                 isActive: false);
                           }),
                     ],
                   )),
                     Padding(
                       padding: EdgeInsets.symmetric(
                           horizontal: 10.w, vertical: 20.h),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             "aboutcompany".tr,
                             style: Theme.of(context).textTheme.headline1,
                           ),
                           SizedBox(
                             height: 20.h,
                           ),
                           Expanded(
                               child: Text(
                             "is an American multinational corporation and technology company focusing on online advertising, search engine technology, cloud computing, computer software, quantum computing, e-commerce, consumer electronics, and artificial intelligence It has been referred to as the most powerful company in the world",
                             style: TextStyles.w40014grey(context),
                           ))
                         ],
                       ),
                     ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "companyproducts".tr,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        )),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
