import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/images.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/core/localization/change_language.dart';


bool isarabic = false;
bool isenglish = false;

class ChooseLanguage extends GetView<ChangeLanguage> {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Dimensions.screenHeight(context) / 10,
          ),
          Text(
            "chooselanguage".tr,
            style: Theme.of(context).textTheme.headline1,
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          SizedBox(
            height: Dimensions.screenHeight(context) / 3.5,
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
                    isarabic = true;
                    isenglish = false;
                    controller.changeColor();
                    controller.changeLang("ar");
                  },
                  child: Container(
                      width: double.infinity,
                      height: Dimensions.screenHeight(context) / 13,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: isarabic
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
                              style: TextStyles.bold17,
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
                    isarabic = false;
                    isenglish = true;

                    controller.changeColor();
                    controller.changeLang("en");
                  },
                  child: Container(
                      width: double.infinity,
                      height: Dimensions.screenHeight(context) / 13,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: isenglish
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
                              style: TextStyles.bold17,
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
              if (isarabic || isenglish) Get.offNamed("OnBoarding");
            },
            child: Container(
              width: Dimensions.screenwidth(context),
              height: 40.h,
              margin: const EdgeInsets.symmetric(horizontal: 80),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                 color: lightAppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "continuebutton".tr,
                style: TextStyles.w50012White,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
