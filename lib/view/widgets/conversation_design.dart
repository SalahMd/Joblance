import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/chat/texting_page.dart';

class ConversationDesign extends StatelessWidget {
  const ConversationDesign({
    Key? key,
    required this.image,
    required this.messengerName,
    required this.message,
    required this.date,
    required this.id,
    required this.senderId,
    required this.newMessages,
    required this.messageType,
  }) : super(key: key);

  final String image;
  final String id;
  final String newMessages;
  final String senderId;
  final String messengerName;
  final String message;
  final String date;
  final String messageType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(TextingPage(
          id: id,
          image: image,
          userName: messengerName,
        ));
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      image[0] == "h"
                          ? image
                          : AppLinks.IP+'/$image',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 5.w),
                        child: Text(
                          messengerName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1, // Limit to 1 line
                          style: TextStyles.w50015(context),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        children: [
                          messageType != "text"
                              ? Padding(
                                  padding: EdgeInsetsDirectional.only(end: 5.w),
                                  child: Icon(
                                    messageType == "image"
                                        ? Icons.image_outlined
                                        : Icons.file_copy_outlined,
                                    size: 14.sp,
                                    color: LightAppColors.greyColor,
                                  ),
                                )
                              : Container(),
                          Expanded(
                            child: Text(
                              message,
                              style: TextStyles.w40013grey(context),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: newMessages == "0"
                          ? TextStyles.w40010grey(context)
                          : TextStyle(
                              fontWeight: FontWeight.w500,
                              color: LightAppColors.greenColor,
                              fontSize: 10.sp,
                            ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    newMessages != "0"
                        ? Container(
                            width: 19.w,
                            margin: EdgeInsets.only(top: 10.h),
                            height: 22.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: LightAppColors.greenColor,
                            ),
                            child: Text(
                              newMessages,
                              style: TextStyles.w50011White(context),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Divider(
              color: LightAppColors.greyColor,
              thickness: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
