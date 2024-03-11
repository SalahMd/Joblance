import 'package:flutter/material.dart';
import 'package:joblance/core/constants/colors.dart';

class AppButtons {
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: LightAppColors.primaryColor,
    padding: const EdgeInsets.only(left: 80, right: 80, top: 5, bottom: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
  static Decoration buttonDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: LightAppColors.primaryColor,
  );
}
