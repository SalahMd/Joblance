import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/texting_page_controller.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/links.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/view/screens/chat/chat_text_field.dart';
import 'package:joblance/view/screens/image_view.dart';
import 'package:joblance/view/screens/profile/company_profile/company_profile.dart';

class TextingPage extends StatelessWidget {
  final String? id;
  final String image;
 final String userName;
  final String? userId;

  TextingPage({
    Key? key,
     this.id,
     this.userId,
    required this.image,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TextingPageControllerImpl(id: id, userId: userId));
    return Scaffold(
      body: GetBuilder<TextingPageControllerImpl>(
        builder: (controller) => Stack(
          children: [
            Column(
              children: [
                SafeArea(
                  child: Container(
                    color: Theme.of(context).colorScheme.surface,
                    width: Dimensions.screenWidth(context),
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              width: 40,
                              height: 40,
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
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              width: 150.w,
                              child: Text(
                                userName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyles.w50014(context),
                              ),
                            ),
                          ],
                        ),
                        !controller.isDelete
                            ? GestureDetector(
                                onTap: () {
                                  Get.to(CompanyProfile());
                                },
                                child: Icon(Icons.info_outline),
                              )
                            : GestureDetector(
                                onTap: () {
                                  controller.deleteMessage(context);
                                },
                                child: Icon(
                                  Icons.delete_outline,
                                  color: Colors.red[800],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 0.3,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.messages.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onLongPress: () {
                                  controller.selectedMessage[index] =
                                      !controller.selectedMessage[index];
                                  controller.isDelete = true;
                                  controller.update();
                                },
                                onTap: () {
                                  for (int i = 0;
                                      i < controller.messages.length;
                                      i++) {
                                    if (controller.selectedMessage[i] == true) {
                                      controller.selectedMessage[index] =
                                          !controller.selectedMessage[index];
                                      controller.update();
                                      break;
                                    }
                                  }
                                },
                                child: Align(
                                  alignment: controller
                                              .messages[index].senderId ==
                                          controller.messages[index].reciverId
                                      ? AlignmentDirectional.topEnd
                                      : AlignmentDirectional.topStart,
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15.w,
                                        vertical: 6.h,
                                      ),
                                      margin: EdgeInsets.symmetric(
                                        vertical: 3.h,
                                        horizontal: 15.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            controller.selectedMessage[index] !=
                                                    true
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primaryContainer
                                                : Colors.blue,
                                        borderRadius: controller
                                                    .messages[index].senderId ==
                                                controller
                                                    .messages[index].reciverId
                                            ? BorderRadiusDirectional.only(
                                                topEnd: Radius.circular(15),
                                                topStart: Radius.circular(10),
                                                bottomStart:
                                                    Radius.circular(10))
                                            : BorderRadiusDirectional.only(
                                                topEnd: Radius.circular(15),
                                                bottomStart:
                                                    Radius.circular(10),
                                                bottomEnd: Radius.circular(10)),
                                      ),
                                      child: controller.messages[index].type
                                                  .toString() ==
                                              "text"
                                          ? Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  controller
                                                      .messages[index].message!,
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10.h),
                                                  child: Text(
                                                    controller.messages[index]
                                                        .timeStamp!,
                                                    style: TextStyles.w4009grey(
                                                        context),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : controller.messages[index].type
                                                      .toString() ==
                                                  "image"
                                              ? Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.to(ImageView(
                                                            image:
                                                                'http://192.168.1.105:8000/${controller.messages[index].message!}'));
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: controller
                                                                        .messages[
                                                                            index]
                                                                        .message![
                                                                    0] !=
                                                                "/"
                                                            ? Image.network(
                                                                'http://192.168.1.105:8000/${controller.messages[index].message!}',
                                                                fit: BoxFit
                                                                    .cover)
                                                            : Image.file(File(
                                                                "${controller.messages[index].message!}")),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.end,
                                                        controller
                                                            .messages[index]
                                                            .timeStamp!,
                                                        style: TextStyles
                                                            .w4009grey(context),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 0.4,
                                                          color: LightAppColors
                                                              .greyColor!),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w,
                                                      vertical: 5.h),
                                                  width: 140.w,
                                                  height: 60.h,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .file_copy_outlined,
                                                            color:
                                                                Colors.red[800],
                                                            size: 20.sp,
                                                          ),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          Text(
                                                            controller
                                                                .messages[index]
                                                                .fileName!,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyles
                                                                .w50012(
                                                                    context),
                                                          ),
                                                        ],
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .downloadFile(
                                                                  controller
                                                                      .messages[
                                                                          index]
                                                                      .message);
                                                        },
                                                        child: Icon(
                                                          Icons.file_download,
                                                          size: 15.sp,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: ChatTextField(
                            controller: controller,
                            key: key,
                          )),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.sendMessage();
                        },
                        child: Container(
                          margin:
                              EdgeInsetsDirectional.only(end: 15, bottom: 5.h),
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: LightAppColors.greenColor),
                          child: Icon(
                            Icons.send_outlined,
                            size: 20.sp,
                            color: LightAppColors.whiteColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            !controller.isMaxPosition
                ? PositionedDirectional(
                    bottom: 75.h,
                    end: 22.w,
                    height: 37,
                    width: 36,
                    child: GestureDetector(
                      onTap: () {
                        controller.scrollDown();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: LightAppColors.greyColor,
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.arrow_downward_outlined,
                            size: 16.sp,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ))
                : Container()
          ],
        ),
      ),
    );
  }
}
