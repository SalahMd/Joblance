import 'package:flutter/material.dart';
import '../functions/valid_input.dart';

class Customtextformfiled extends StatelessWidget {
  final String hinttext;
  final String labelText;
  final IconData icondata;
  final TextEditingController? controller;
  final int min;
  final int max;
  final bool isnumber;
  final bool ispassword;
  final bool? isBorder;
  final int? maxLines;
  final int? letters;
  final void Function()? ontapicon;
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
    this.maxLines,
    this.letters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: TextFormField(
        obscureText: ispassword,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        keyboardType: isnumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: (val) {
          return validInput(val!, min, max);
        },
        //maxLines: maxLines,
        maxLength: letters,
        controller: controller,
        decoration: InputDecoration(
          enabled: true,
          hintText: hinttext,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          hintStyle: const TextStyle(
              fontSize: 17, color: Colors.grey), // Set hint text color
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          label: Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              labelText,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),

          suffixIcon: GestureDetector(
            onTap: ontapicon,
            child: Icon(
              icondata,
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
