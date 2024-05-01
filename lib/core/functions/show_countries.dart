import 'dart:async';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

Future<String?> showCountries(BuildContext context) {
  Completer<String?> completer = Completer<String?>();

  showCountryPicker(
    context: context,
    showPhoneCode: true,
    onSelect: (Country c) {
      String selectedCountry = c.flagEmoji+" "+c.name;
      completer.complete(selectedCountry);
    },
  );

  return completer.future;
}
