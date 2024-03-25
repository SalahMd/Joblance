import 'dart:async';
import 'package:flutter/material.dart';
selectDate(BuildContext context) async {
  Completer<String?> completer = Completer<String?>();
  DateTime? picked = await showDatePicker(
    context: context,
    firstDate: DateTime(1940),
    lastDate: DateTime(2010),
    initialDate: DateTime(2003),
  );

  if (picked != null) {
    String formattedDate = "${picked.year}-${picked.month}-${picked.day}";
    completer.complete(formattedDate);
    print(formattedDate);
    return completer.future;
  } else {
    return null;
  }
}
