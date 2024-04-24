import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/texting_page_controller.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/chat/chat_text_field.dart';
import 'package:joblance/view/screens/image_view.dart';
import 'package:joblance/view/screens/profile/company_profile/company_profile.dart';

class TextingPage extends StatelessWidget {
  final String id;
  final String image;
  final String userName;
  final String userId;
  TextingPage(
      {Key? key,
      required this.id,
      required this.userId,
      required this.image,
      required this.userName})
      : super(key: key);

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
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                                    'http://192.168.1.105:8000/$image',
                                    fit: BoxFit.cover,
                                    width: 40,
                                    height: 40),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              userName,
                              style: TextStyles.w50014(context),
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.to(CompanyProfile());
                            },
                            child: Icon(Icons.info_outline)),
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
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.messages.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Align(
                                alignment:
                                    controller.messages[index].senderId ==
                                            controller.messages[index].reciverId
                                        ? AlignmentDirectional.topEnd
                                        : AlignmentDirectional.topStart,
                                child: Container(
                                    //constraints: BoxConstraints(maxHeight: 200.h),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.w,
                                      vertical: 6.h,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      vertical: 3.h,
                                      horizontal: 15.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      borderRadius: controller
                                                  .messages[index].senderId ==
                                              controller
                                                  .messages[index].reciverId
                                          ? BorderRadiusDirectional.only(
                                              topEnd: Radius.circular(15),
                                              topStart: Radius.circular(10),
                                              bottomStart: Radius.circular(10))
                                          : BorderRadiusDirectional.only(
                                              topEnd: Radius.circular(15),
                                              bottomStart: Radius.circular(10),
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
                                                padding:
                                                    EdgeInsets.only(top: 10.h),
                                                child: Text(
                                                  controller.messages[index]
                                                      .timeStamp!,
                                                  style: TextStyles.w4009grey(
                                                      context),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(ImageView(
                                                      image:
                                                          'http://192.168.1.105:8000/${controller.messages[index].message!}'));
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                      'http://192.168.1.105:8000/${controller.messages[index].message!}',
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  textAlign: TextAlign.end,
                                                  controller.messages[index]
                                                      .timeStamp!,
                                                  style: TextStyles.w4009grey(
                                                      context),
                                                ),
                                              ),
                                            ],
                                          )),
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
                          height: 45.h,
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
