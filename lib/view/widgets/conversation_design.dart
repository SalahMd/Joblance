import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/chat/texting_page.dart';

class ConversationDesign extends StatelessWidget {
  const ConversationDesign(
      {super.key,
      required this.image,
      required this.messengerName,
      required this.message,
      required this.date,
      required this.id,
      required this.senderId,
      required this.reciverId,
      required this.newMessages,
      required this.messageType});
  final String image;
  final String id;
  final String newMessages;
  final String reciverId;
  final String senderId;
  final String messengerName;
  final String message;
  final String date;
  final String messageType;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(TextingPage(
              id: id,
              userId: reciverId,
              image: image,
              userName: messengerName,
            ));
          },
          child: Container(
            width: Dimensions.screenWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
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
                            'http://192.168.1.105:8000/$image',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            messengerName,
                            style: TextStyles.w50015(context),
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            children: [
                              messageType == "image"
                                  ? Padding(
                                      padding:
                                          EdgeInsetsDirectional.only(end: 5.w),
                                      child: Icon(
                                        Icons.image_outlined,
                                        size: 14.sp,
                                        color: LightAppColors.greyColor,
                                      ),
                                    )
                                  : Container(),
                              Text(
                                message,
                                style: TextStyles.w40013grey(context),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date,
                        style: newMessages == "0"
                            ? TextStyles.w40010grey(context)
                            : TextStyle(
                                fontWeight: FontWeight.w500,
                                color: LightAppColors.greenColor,
                                fontSize: 10.sp),
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
                                  color: LightAppColors.greenColor),
                              child: Text(
                                newMessages,
                                style: TextStyles.w50011White(context),
                              ),
                            )
                          : Text("")
                    ],
                  ),
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
