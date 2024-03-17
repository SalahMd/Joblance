import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/texting_page_controller.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/widgets/divider.dart';

class TextingPage extends StatelessWidget {
  TextingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TextingPageControllerImpl());
    return Scaffold(
      body: GetBuilder<TextingPageControllerImpl>(
        builder: (controller) => Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            SafeArea(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(AppImages
                            .Linkedin), // Replace with actual image path
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "Linkedin",
                      style: TextStyles.w50014(context),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 0.3,
              color: LightAppColors.greyColor,
            ),
            Expanded(
              child: SingleChildScrollView(
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
                            alignment: AlignmentDirectional.topEnd,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 10.h,
                              ),
                              margin: EdgeInsets.symmetric(
                                vertical: 7,
                                horizontal: 10,
                              ),
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                controller.messages[index],
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Customtextformfiled(
                hinttext: "message".tr,
                labelText: "",
                icondata: Icons.send_outlined,
                controller: controller.message,
                min: 0,
                max: 100,
                isnumber: false,
                ispassword: false,
                isBorder: true,
                isLabel: false,
                padding: 1,
                ontapicon: () {
                  controller.sendMessage();
                  print(controller.messages);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
