import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/profile/freelancer_profile/freelancer_profile.dart';

class FreeLancerDesign extends StatelessWidget {
  final String name;
  final String bio;
  final String location;
  final String image;
  final String major;
  final int id;
  const FreeLancerDesign(
      {super.key,
      required this.name,
      required this.bio,
      required this.location,
      required this.image,
      required this.major,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(FreelancerProfile(
            id: id,
          ));
        },
        child: Container(
            width: Dimensions.screenWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                    width: 45,
                    height: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        image[0] == "h" ? image : AppLinks.IP + "/" + image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsetsDirectional.only(end: 8.w),
                          child: Text(
                            name,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.w50013(context),
                            maxLines: 1,
                          ),
                        ),
                        Text(
                          major,
                          style: TextStyles.w40012grey(context),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      end: 8.w,
                    ),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).colorScheme.primaryContainer),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      size: 17.sp,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 5.w),
                  child: Text(
                    bio,
                    style: TextStyles.w40010grey(context),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        SizedBox(width: 8.w),
                        Text(
                          location,
                          style: TextStyles.w40012grey(context),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: 20.sp,
                          color: LightAppColors.primaryColor,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "100 followers",
                          style: TextStyles.w40012grey(context),
                        ),
                      ],
                    ))
                  ],
                )
              ],
            ))).animate().fade(duration: 600.ms).slideY(begin: 0.5);
  }
}
