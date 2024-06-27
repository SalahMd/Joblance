import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class JobApplicantDesign extends StatelessWidget {
  final String name, email, major, date, image, id;
  final String? coverLetter;
  const JobApplicantDesign(
      {super.key,
      required this.name,
      required this.email,
      required this.major,
      required this.date,
      required this.image,
      required this.coverLetter,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth(context),
      // height: 220.h,
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
                        width: 40.sp,
                        height: 40.sp,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            AppLinks.IP + image,
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
                                name,
                                style: TextStyles.w50014(context),
                              ),
                            ],
                          ),
                          Text(
                            major,
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
                      Text(email,
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
                      Text(Jiffy.parse(date).fromNow().toString(),
                          style: TextStyles.w40011grey(context)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.cases_outlined,
                        size: 12.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("2 years", style: TextStyles.w40011grey(context)),
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
        Visibility(
          visible: coverLetter != null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("coverletter:".tr, style: TextStyles.w50012(context)),
              Text(coverLetter == null ? "" : coverLetter!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.w40011grey(context)),
            ],
          ),
        ),
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
