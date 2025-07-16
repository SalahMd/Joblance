import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/constants/buttons.dart';
import 'package:joblance/core/constants/colors.dart';
import 'package:joblance/core/constants/text_styles.dart';
import 'package:joblance/core/functions/dimenesions.dart';
import 'package:joblance/core/statics/static.dart';
import 'package:joblance/features/on_boarding/controller/on_boarding_controller.dart';

class OnBoarding extends GetView<OnBoardingControllerImpl> {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImpl());
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.screenHeight(context) - 150.h,
            width: Dimensions.screenWidth(context),
            child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (val) {
                  controller.onPageChanged(val);
                },
                itemCount: Onbordingmodel.length,
                itemBuilder: (context, int i) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        SafeArea(
                          child: Container(
                            width: Dimensions.screenWidth(context),
                            height: 300.h,
                            child: Image.asset(
                              Onbordingmodel[i].animation!,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          Onbordingmodel[i].title!,
                          style: TextStyles.bold20(context),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          Onbordingmodel[i].body!,
                          textAlign: TextAlign.center,
                          style: TextStyles.w40014grey(context),
                        )
                      ],
                    )),
          ),
          Row(
            children: [
              GetBuilder<OnBoardingControllerImpl>(
                builder: (controller) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                        Onbordingmodel.length,
                        (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 700),
                              width: controller.currentPage == index ? 20 : 8,
                              height: 8,
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: LightAppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                            )),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 50.h)),
              ElevatedButton(
                onPressed: () {
                  controller.next();
                },
                style: AppButtons.elevatedButtonStyle,
                child: Text(
                  "continuebutton".tr,
                  style: TextStyles.w50016White(context),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
