import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppAnimations {
  static const String path = "assets/animations/";
  static LottieBuilder wrong = Lottie.asset(path + "wrong.json", repeat: false);
  static LottieBuilder done = Lottie.asset(path + "done.json", repeat: false);
  static LottieBuilder info = Lottie.asset(path + "info.json", repeat: false);
  static LottieBuilder noInternet =
      Lottie.asset(path + "no_internet.json", repeat: false);
  static LottieBuilder loadings =
      Lottie.asset(path + "confirmloading.json", width: 120.w, height: 120.h);
  static LottieBuilder loadingDots =
      Lottie.asset(path + "loadingDots.json", repeat: true);
  static LottieBuilder serverError =
      Lottie.asset(path + "server_error.json", repeat: false);
  static LottieBuilder subscription =
      Lottie.asset(path + "subscription.json", repeat: false,fit: BoxFit.fill);
}
