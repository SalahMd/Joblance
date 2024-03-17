import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/widgets/divider.dart';

class FreelancerProfile extends StatelessWidget {
  const FreelancerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exitAlert,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: Dimensions.screenWidth(context),
                    height: 180.h,
                    color: Colors.grey,
                    child: Image.asset(
                      AppImages.joblance,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: 90.w,
                    height: 100.h,
                    alignment: Alignment.center,
                    margin:
                        EdgeInsets.only(left: 10.w, right: 10.w, top: 125.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          AppImages.Linkedin,
                          fit: BoxFit.fill,
                        )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      "Salah Aldeen Mdaghmesh",
                      style: TextStyles.w50017(context),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Icon(
                          Icons.work_outline,
                          size: 18,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "IT engineer",
                          style: TextStyles.w40012grey(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Container(
                          width: 13.w,
                          height: 15.h,
                          child: Image.asset(
                            AppImages.followers,
                            color: Theme.of(context).colorScheme.onSecondary,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "100 followersn",
                          style: TextStyles.w40012grey(context),
                        ),
                      ],
                    ),
                    MyDivider(),
                    SizedBox(height: 20.h),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      padding: EdgeInsets.symmetric(
                          vertical: 20.w, horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person_outline),
                              SizedBox(width: 10.w),
                              Text(
                                "Salah Aldeen Mdaghmesh",
                                style: TextStyles.w40011(context),
                              )
                            ],
                          ),
                          MyDivider(
                            height: 12.h,
                          ),
                          Row(
                            children: [
                              Icon(Icons.mail_outline),
                              SizedBox(width: 10.w),
                              Text(
                                "salahaldeenmdaghmesh@gmail.com",
                                style: TextStyles.w40011(context),
                              )
                            ],
                          ),
                          MyDivider(
                            height: 12.h,
                          ),
                          Row(
                            children: [
                              Icon(Icons.phone_outlined),
                              SizedBox(width: 10.w),
                              Text(
                                "+963996541809",
                                style: TextStyles.w40011(context),
                              )
                            ],
                          ),
                          MyDivider(
                            height: 12.h,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined),
                              SizedBox(width: 10.w),
                              Text(
                                "Syria",
                                style: TextStyles.w40011(context),
                              )
                            ],
                          ),
                          MyDivider(
                            height: 12.h,
                          ),
                          Row(
                            children: [
                              Icon(Icons.work_outline),
                              SizedBox(width: 10.w),
                              Text(
                                "IT engineer",
                                style: TextStyles.w40011(context),
                              )
                            ],
                          ),
                          MyDivider(
                            height: 12.h,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 20.w,
                                height: 23.h,
                                child: Image.asset(
                                  AppImages.studyCase,
                                  fit: BoxFit.fill,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "Ungraduated",
                                style: TextStyles.w40011(context),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
