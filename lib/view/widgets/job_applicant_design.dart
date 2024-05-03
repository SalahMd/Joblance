import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class JobApplicantDesign extends StatelessWidget {
  const JobApplicantDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth(context),
      height: 220.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            AppImages.salah,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Salah Aldeen",
                                style: TextStyles.w50014(context),
                              ),
                            ],
                          ),
                          Text(
                            "Flutter developer",
                            style: TextStyles.w50012(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        size: 12.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("salahaldeenmdaghmesh@gmail.com".tr,
                          maxLines: 2, style: TextStyles.w40011grey(context)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 12.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("2 weeks ago".tr,
                          style: TextStyles.w40011grey(context)),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Icon(
                  Icons.delete_outline,
                  size: 20.sp,
                  color: Colors.red[800],
                ),
              )
            ]),
        SizedBox(
          height: 5.h,
        ),
        Text("cover letter:", style: TextStyles.w50012(context)),
        Text(
            "I would like to applay for this job because i found my experiences match the job requirements and i expect that i can add more success for this company",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.w40011grey(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(end: 10.w, top: 5.h),
              child: Text(
                "showmore".tr,
                style: TextStyle(
                    color: LightAppColors.primaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
