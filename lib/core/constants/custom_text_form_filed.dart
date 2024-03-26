import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/colors.dart';
import '../functions/valid_input.dart';

class Customtextformfiled extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData? iconData;
  final TextEditingController? controller;
  final int min;
  final int max;
  final bool isNumber;
  final bool isPassword;
  final bool isBorder;
  final int maxLines;
  final int? letters;
  final bool isFilled;
  final bool isLabel;
  final void Function()? ontapicon;
  final double? padding;
  final bool isValidation;
  Customtextformfiled({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    required this.controller,
    required this.min,
    required this.max,
    required this.isNumber,
    required this.isPassword,
    this.ontapicon,
    this.isBorder = true,
    TextStyle? style,
    this.maxLines = 1,
    this.letters,
    this.isLabel = true,
    this.padding = 20,
    this.isFilled = false,
    this.isValidation = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: padding!.h, left: 10.w, right: 10.w),
      decoration: isFilled
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primaryContainer,
            )
          : null,
      child: TextFormField(
        obscureText: isPassword,
        style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: isValidation
            ? (val) {
                return validInput(val!, min, max);
              }
            : null,
        maxLength: letters,
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          enabled: true,
          hintText: hintText,
          border: isBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              : InputBorder.none, // Hide bottom line,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          hintStyle: const TextStyle(fontSize: 17, color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          label: isLabel
              ? Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    labelText,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                )
              : null,
          suffixIcon: GestureDetector(
            onTap: ontapicon,
            child: Container(
              child: Icon(
                iconData,
                color: !isPassword && ontapicon != null
                    ? Colors.red
                    : Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
          focusedBorder: isBorder == null
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                )
              : null,
        ),
      ),
    );
  }
}
