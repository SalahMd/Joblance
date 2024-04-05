import 'package:get/get.dart';
import 'package:joblance/core/localization/arabic_language.dart';
import 'package:joblance/core/localization/english_language.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": arabic,
        "en":english
      };
}
