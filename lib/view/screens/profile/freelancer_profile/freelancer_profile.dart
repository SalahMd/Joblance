import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/profiles_controller/freelancer_profile_controller.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/profile/tob_bar.dart';
import 'package:joblance/view/widgets/divider.dart';
import 'package:joblance/view/widgets/project_design.dart';
import 'package:joblance/view/widgets/tab_bar.dart';

class FreelancerProfile extends StatelessWidget {
  const FreelancerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FreelancerProfileControllerImpl());
    return Scaffold(
      body: GetBuilder<FreelancerProfileControllerImpl>(
        builder: (controller) => DefaultTabController(
          length: controller.tabs.length,
          child: SingleChildScrollView(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  fit: FlexFit.loose,
                  child: TobBar(
                    image: AppImages.salah,
                    name: "Salah Mdaghmesh",
                    description: "IT developer",
                  )),
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
                height: 500.h,
                child: TabBarView(children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "about".tr,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          padding: EdgeInsetsDirectional.only(
                              start: 12.w, bottom: 10.h, top: 10.h),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "bio".tr,
                                style: TextStyles.w50015(context),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "A junior flutter developer in the third year of amascus university, with 2 years of expirence in developing apps."
                                    .tr,
                                style: TextStyles.w40012grey(context),
                              ),
                            ],
                          ),
                        ),
                        MyDivider(
                          height: 12,
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(
                              start: 12.w, bottom: 15.h, top: 10.h),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "studyinfo".tr,
                                style: TextStyles.w50015(context),
                              ),
                              SizedBox(height: 15.h),
                              Row(
                                children: [
                                  Icon(Icons.work_outline),
                                  SizedBox(width: 10.w),
                                  Text("Engineering"),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Icon(Icons.cases_outlined),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "Graduate",
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.h),
                              Row(
                                children: [
                                  Icon(Icons.work_outline),
                                  SizedBox(width: 10.w),
                                  Text("Engineering"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 20.h),
                          child: Text(
                            "projects".tr,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        ProjectDesign(
                            projectTitle: "Joblance",
                            projectDescription:
                                "Job and freelancing app made with flutter and laravel",
                            projectMedia: AppImages.Linkedin,
                            projectLink: "https//www.google.com"),
                        ProjectDesign(
                            projectTitle: "Joblance",
                            projectDescription:
                                "Job and freelancing app made with flutter and laravel",
                            projectMedia: AppImages.Linkedin,
                            projectLink: "https//www.google.com")
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "skills".tr,
                          style: Theme.of(context).textTheme.headline1,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
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
    );
  }
}
