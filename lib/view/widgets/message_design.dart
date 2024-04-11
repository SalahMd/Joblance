import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/chat/texting_page.dart';

class MessageDesign extends StatelessWidget {
  const MessageDesign(
      {super.key,
      required this.image,
      required this.messengerName,
      required this.message,
      required this.date});
  final String image;
  final String messengerName;
  final String message;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(TextingPage());
          },
          child: Container(
            width: Dimensions.screenWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                messengerName,
                                style: TextStyles.w50015(context),
                              ),
                              Text(
                                date,
                                style: TextStyles.w40010grey(context),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            message,
                            style: TextStyles.w40012grey(context),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Divider(
            color: LightAppColors.greyColor,
            thickness: 0.5,
          ),
        )
      ],
    );
  }
}
