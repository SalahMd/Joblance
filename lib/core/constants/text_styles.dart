import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/colors.dart';

class TextStyles {
  static TextStyle _getCustomTextStyle(double fontSize) {
    return TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold);
  }

  static TextStyle get dynamicText {
    double fontSize = ScreenUtil().setSp(17);
    return _getCustomTextStyle(fontSize);
  }

  static TextStyle bold17(BuildContext context) => _getCustomTextStyle(17.sp);
  static TextStyle w50019(BuildContext context) => _getCustomTextStyle(19.sp);
  static TextStyle bold20(BuildContext context) => _getCustomTextStyle(20.sp);
  static TextStyle w50018(BuildContext context) => _getCustomTextStyle(18.sp);
  static TextStyle bold14(BuildContext context) => _getCustomTextStyle(14.sp);
  static TextStyle w50014(BuildContext context) => _getCustomTextStyle(14.sp);
  static TextStyle bold16(BuildContext context) => _getCustomTextStyle(16.sp);
  static TextStyle w50017(BuildContext context) => _getCustomTextStyle(17.sp);
  static TextStyle w50015(BuildContext context) => _getCustomTextStyle(15.sp);

  static TextStyle w50012(BuildContext context) => _getCustomTextStyle(12.sp);
  static TextStyle w40011(BuildContext context) => _getCustomTextStyle(11.sp);
  static TextStyle w50013(BuildContext context) => _getCustomTextStyle(13.sp);
  static TextStyle w40010(BuildContext context) => _getCustomTextStyle(9.sp);

  static TextStyle w40011grey(BuildContext context) => TextStyle(
      color: Colors.grey[700], fontSize: 11.sp, fontWeight: FontWeight.w500);
  static TextStyle w40010grey(BuildContext context) => TextStyle(
      color: Colors.grey[700], fontSize: 10.sp, fontWeight: FontWeight.w500);
  static TextStyle w4009grey(BuildContext context) => TextStyle(
      color: Colors.grey[700], fontSize: 9.sp, fontWeight: FontWeight.w500);
  static TextStyle w40012grey(BuildContext context) => TextStyle(
      color: Colors.grey[700], fontSize: 12.sp, fontWeight: FontWeight.w500);
  static TextStyle w40014grey(BuildContext context) => TextStyle(
      color: Colors.grey[700], fontSize: 14.sp, fontWeight: FontWeight.w500);
  static TextStyle w50015grey(BuildContext context) => TextStyle(
      color: Colors.grey[700], fontSize: 14.sp, fontWeight: FontWeight.w500);

  static TextStyle w40010White(BuildContext context) => TextStyle(
        color: Colors.white,
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
      );
      

  static TextStyle w50012White(BuildContext context) => TextStyle(
        color: Colors.white,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      );

  static TextStyle w50011White(BuildContext context) => TextStyle(
        color: Colors.white,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
      );

  static TextStyle w50016White(BuildContext context) => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        color: LightAppColors.whiteColor,
      );
  static TextStyle w50013White(BuildContext context) => TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: LightAppColors.whiteColor,
      );
}
