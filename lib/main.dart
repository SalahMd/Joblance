import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joblance/core/localization/change_language.dart';
import 'package:joblance/core/middlewere/midlleware.dart';
import 'package:joblance/core/services/services.dart';
import 'package:joblance/view/screens/auth/login.dart';
import 'package:joblance/view/screens/choose_language.dart';
import 'package:joblance/view/screens/on_boarding.dart';
import 'controller/dark_mode.dart';
import 'core/localization/translation.dart';
import 'core/themes/app_theme.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
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
          debugShowCheckedModeBanner:false,
          getPages: [
             GetPage(
                name: "/",
                page: () => ChooseLanguage(),
                middlewares: [MiddleWare()]),
             GetPage(name: "/Login", page: () => const Login()),
            // GetPage(name: "/ChooseLanguage", page: () => ChooseLanguage()),
             GetPage(name: "/OnBoarding", page: () => OnBoarding()),
            // GetPage(name: "/SignUp", page: () => const SignUp()),
            // GetPage(name: "/Search", page: () => const Search()),
            // GetPage(name: "/HomePage", page: () => ButtomBar()),
          ],
        ));
  }
}
