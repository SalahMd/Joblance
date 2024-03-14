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
      onWillPop: 
        exitAlert,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: Dimensions.screenwidth(context),
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
                    margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 125.h),
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
                      style: TextStyles.w50017,
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
                          style: TextStyles.w40012grey,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 18,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "Syria",
                          style: TextStyles.w40012grey,
                        ),
                      ],
                    ),
                    MyDivider(),
                    SizedBox(height: 60.h),
                    Row(
                      children: [
                        Icon(Icons.person_outline),
                        SizedBox(width: 10.w),
                        Text("Salah Aldeen Mdaghmesh")
                      ],
                    ),
                    MyDivider(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(Icons.mail_outline),
                        SizedBox(width: 10.w),
                        Text("salahaldeenmdaghmesh@gmail.com")
                      ],
                    ),
                    MyDivider(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone_outlined),
                        SizedBox(width: 10.w),
                        Text("+963996541809")
                      ],
                    ),
                    MyDivider(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone_outlined),
                        SizedBox(width: 10.w),
                        Text("+963996541809")
                      ],
                    ),
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
