import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';

class FreelancerProfile extends StatelessWidget {
  const FreelancerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            SafeArea(
                child: Center(
              child: Container(
                width: 110.w,
                height: 120.h,
                alignment: Alignment.center,
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
            )),
            SizedBox(height: 20.h),
            Text(
              "Salah Aldeen Mdaghmesh",
              style: TextStyles.w50017,
            ),
            SizedBox(height: 30.h),
            SizedBox(
              height: 80.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.work_outline),
                      SizedBox(height: 10.h),
                      Text(
                        "Engineering",
                        style: TextStyles.w40012grey,
                      ),
                    ],
                  ),
                  VerticalDivider(
                    width: 0.5,
                    thickness: 0.6,
                    //indent: 2.h,
                    endIndent: 10.h,
                    color: Colors.grey,
                  ),
                  Column(
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(height: 10.h),
                      Text(
                        "Syria",
                        style: TextStyles.w40012grey,
                      ),
                    ],
                  ),
                  VerticalDivider(
                    width: 0.5,
                    thickness: 0.6,
                    endIndent: 10.h,
                    color: Colors.grey,
                  ),
                  Column(
                    children: [
                      Icon(Icons.person_outline),
                      SizedBox(height: 10.h),
                      Text(
                        "Graduated",
                        style: TextStyles.w40012grey,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
