import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/localization/change_language.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/view/screens/add_project_or_product/add_project_or_product.dart';
import 'package:joblance/view/screens/auth/login.dart';
import 'package:joblance/view/screens/auth/email_verifiction.dart';
import 'package:joblance/view/screens/auth/sign_up/sign_up.dart';
import 'package:joblance/view/screens/choose_language.dart';
import 'package:joblance/view/screens/navigation_bar/nav_bar.dart';
import 'package:joblance/view/screens/on_boarding.dart';
import 'package:joblance/view/screens/search/search.dart';
import 'package:joblance/view/screens/splash_sceen%20.dart';
import 'controller/settings_controller/dark_mode.dart';
import 'core/localization/translation.dart';
import 'core/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ChangeLanguage controller = Get.put(ChangeLanguage());
    DarkModeImpl themeController = Get.put(DarkModeImpl());
    return ScreenUtilInit(
        designSize: const Size(320, 790),
        child: GetMaterialApp(
          locale: controller.language,
          translations: Translation(),
          themeMode: themeController.themeMode,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(
              name: "/",
              page: () => SplashScreen(),
              // middlewares: [MiddleWare()]
            ),
            GetPage(name: "/Login", page: () => const Login()),
            GetPage(name: "/ChooseLanguage", page: () => ChooseLanguage()),
            GetPage(name: "/OnBoarding", page: () => OnBoarding()),
            GetPage(name: "/SignUp", page: () => const SignUp()),
            GetPage(name: "/Search", page: () => const Search()),
            GetPage(name: "/HomePage", page: () => ButtomBar()),
            GetPage(
                name: "/EmailVerification", page: () => EmailVerification()),
          ],
        ));
  }
}
