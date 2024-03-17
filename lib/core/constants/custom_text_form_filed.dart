import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joblance/core/constants/colors.dart';
import '../functions/valid_input.dart';

class Customtextformfiled extends StatelessWidget {
  final String hinttext;
  final String labelText;
  final IconData? icondata;
  final TextEditingController? controller;
  final int min;
  final int max;
  final bool isnumber;
  final bool ispassword;
  final bool? isBorder;
  final int maxLines;
  final int? letters;
  final bool isFilled ;
  final bool isLabel;
  final void Function()? ontapicon;
  final double? padding;
  Customtextformfiled({
    super.key,
    required this.hinttext,
    required this.labelText,
    required this.icondata,
    required this.controller,
    required this.min,
    required this.max,
    required this.isnumber,
    required this.ispassword,
    this.ontapicon,
    this.isBorder,
    TextStyle? style,
    this.maxLines = 1,
    this.letters,
    this.isLabel = true,
    this.padding = 20,
    this.isFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: padding!.h, left: 10.w, right: 10.w),
      decoration:isFilled? BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ):null,
      child: TextFormField(
        obscureText: ispassword,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        keyboardType: isnumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: (val) {
          return validInput(val!, min, max);
        },
        maxLength: letters,
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          enabled: true,
          hintText: hinttext,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
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
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                )
              : null,
          suffixIcon: GestureDetector(
            onTap: ontapicon,
            child: Container(
              child: Icon(
                icondata,
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
