import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/controller/splash_screen_controller.dart';
import 'package:joblance/core/constants/animations.dart';
import 'package:joblance/core/constants/images.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenControllerImpl());
    return GetBuilder<SplashScreenControllerImpl>(
        builder: (controller) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.joblance)
                        .animate()
                        .fade(duration: 1200.ms)
                        .slideY(begin: -0.3),
                    Container(
                      width: 80.w,
                      height: 50.h,
                      child: AppAnimations.loadingDots,
                    ).animate().fade(delay: 1000.ms)
                  ],
                ),
              ),
            ));
  }
}

