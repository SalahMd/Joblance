import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

selectDate(BuildContext context, [DateTime? finishDate]) async {
  Completer<String?> completer = Completer<String?>();
  DateTime date;
  if (finishDate != null) {
    date = finishDate;
  } else {
    date = DateTime(2010);
  }
  DateTime? picked = await showDatePicker(
    context: context,
    firstDate: DateTime(1940),
    lastDate: date,
    initialDate: DateTime(2003),
  );

  if (picked != null) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
    completer.complete(formattedDate);
    return completer.future;
  } else {
    return null;
  }
}
