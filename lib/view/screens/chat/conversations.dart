import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:joblance/controller/chat_list_controller.dart';
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/alerts.dart';
import 'package:joblance/view/screens/chat/conversations_shimmer.dart';
import 'package:joblance/view/widgets/conversation_design.dart';

class Conversations extends StatelessWidget {
  const Conversations({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      ChatListControllerImpl(),
    );
    return PopScope(
        onPopInvoked: exitAlert,
        child: Scaffold(
          body: GetBuilder<ChatListControllerImpl>(
            builder: (controller) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SafeArea(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Text(
                      "messages".tr,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  )),
                  SizedBox(
                    height: 5.h,
                  ),
                  controller.statusRequest==StatusRequest.loading?
                  ConversationsShimmer():
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.conversations.length,
                    itemBuilder: (context, index) {
                      print(controller.conversations[index]['participant']
                          ['image'][0]);
                      return ConversationDesign(
                        image: controller.conversations[index]['participant']
                            ['image'],
                        messengerName: controller.conversations[index]
                            ['participant']['name'],
                        message: controller.conversations[index]['last_message']
                                    ['type'] ==
                                "text"
                            ? controller.conversations[index]['last_message']
                                ['body']
                            : controller.conversations[index]['last_message']
                                        ['type'] ==
                                    "image"
                                ? "image".tr
                                : "file".tr,
                        date: Jiffy.parse(controller.conversations[index]
                                ['last_message']['date'])
                            .format(pattern: "h:mm a"),
                        id: controller.conversations[index]['id'].toString(),
                        senderId: controller.conversations[index]['participant']
                                ['id']
                            .toString(),
                       
                        newMessages: controller.conversations[index]
                                ['new_messages']
                            .toString(),
                        messageType: controller.conversations[index]
                            ['last_message']['type'],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
