import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/core/localization/change_language.dart';

bool isArabic = false;
bool isEnglish = false;

class ChooseLanguage extends GetView<ChangeLanguage> {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
          ),
          SafeArea(
            child: Text(
              "chooselanguage".tr,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          SizedBox(
            height: 200.h,
            child: Image.asset(AppImages.language),
          ),
          const Padding(padding: EdgeInsets.only(top: 40)),
          Container(
            width: double.infinity,
            height: Dimensions.screenHeight(context) / 5,
            margin: const EdgeInsets.only(left: 30, right: 30),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    isArabic = true;
                    isEnglish = false;
                    controller.changeColor();
                    controller.changeLang("ar");
                  },
                  child: Container(
                      width: double.infinity,
                      height: Dimensions.screenHeight(context) / 13,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: isArabic
                            ? Colors.blue[700]
                            : Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "arabic".tr,
                              style: TextStyles.bold17(context),
                            ),
                            SizedBox(
                                width: 40,
                                height: Dimensions.screenHeight(context) / 14,
                                child: Image.asset(AppImages.arabicimage))
                          ],
                        ),
                      )),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                GestureDetector(
                  onTap: () {
                    isArabic = false;
                    isEnglish = true;

                    controller.changeColor();
                    controller.changeLang("en");
                  },
                  child: Container(
                      width: double.infinity,
                      height: Dimensions.screenHeight(context) / 13,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: isEnglish
                            ? Colors.blue[700]
                            : Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "english".tr,
                              style: TextStyles.bold17(context),
                            ),
                            SizedBox(
                                width: 40,
                                height: Dimensions.screenHeight(context) / 14,
                                child: Image.asset(AppImages.englishimage))
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 40)),
          GestureDetector(
            onTap: () {
              if (isArabic || isEnglish) Get.offNamed("OnBoarding");
            },
            child: Container(
              width: Dimensions.screenWidth(context),
              height: 45.h,
              margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: LightAppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Text("continuebutton".tr,
                  style: TextStyle(color: Colors.white, fontSize: 15.sp)),
            ),
          ),
        ],
      ),
    );
  }
}
