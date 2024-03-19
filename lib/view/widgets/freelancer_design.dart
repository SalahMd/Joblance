import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';

class FreeLancerDesign extends StatelessWidget {
  const FreeLancerDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
         // Get.to(FreelancerProfile());
        },
        child: Container(
            width: Dimensions.screenWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]!),
              // color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(children: [
                          Container(
                            width: 45,
                            height: 45,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
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
                              Text(
                                "Salah Aldeen",
                                style: TextStyles.w50014(context),
                              ),
                              Text(
                                "Softwere engineer",
                                style: TextStyles.w40012grey(context),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        ]),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(
                          end: 10.w,
                        ),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:
                                Theme.of(context).colorScheme.primaryContainer),
                        child: Icon(Icons.favorite_border_outlined),
                      ),
                    ]),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 5.w),
                  child: Text(
                    "Third year Information technology engineering student Junior Flutter developer",
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
                        Icon(
                          Icons.location_on_outlined,
                          size: 20.sp,
                          color: LightAppColors.primaryColor,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Syria",
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
