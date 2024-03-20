import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/texting_page_controller.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/custom_text_form_filed.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/view/screens/profile/company_profile.dart';

class TextingPage extends StatelessWidget {
  TextingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TextingPageControllerImpl());
    return Scaffold(
      body: GetBuilder<TextingPageControllerImpl>(
        builder: (controller) => Column(
          children: [
            // SizedBox(
            //   height: 10.h,
            // ),
            SafeArea(
              child: Container(
                color: Theme.of(context).colorScheme.surface,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
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
                                vertical: 5.h,
                                horizontal: 15.w,
                              ),
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadiusDirectional.only(
                                    topEnd: Radius.circular(22),
                                    topStart: Radius.circular(20),
                                    bottomStart: Radius.circular(20)),
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
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Customtextformfiled(
                      hinttext: "message".tr,
                      labelText: "",
                      icondata: null,
                      controller: controller.message,
                      min: 0,
                      max: 100,
                      isnumber: false,
                      ispassword: false,
                      isBorder: true,
                      isLabel: false,
                      padding: 2,
                      isFilled: true,
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          controller.sendMessage();
                        },
                        child: Container(
                            margin: EdgeInsetsDirectional.only(
                                end: 20, bottom: 5.h),
                            height: 50.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: LightAppColors.greenColor),
                            child: Icon(
                              Icons.send_outlined,
                              size: 20.sp,
                            ))))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
