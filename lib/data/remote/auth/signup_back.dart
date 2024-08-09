import 'dart:io';

import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class SignUpBack {
  Crud crud;
  SignUpBack(this.crud);

  signUp(Map<String, String> data, File image) async {
    var response = await crud.postAndGetData(
        AppLinks.signUp, data, {"accept": "application/json"}, "image", true, true, image);
    return response.fold((l) => l, (r) => r);
  }

  googleSignUp(
    Map data,
  ) async {
    var response = await crud.postAndGetData(
        AppLinks.googleSignup, data, {"accept": "application/json"}, null, true, false, null);
    return response.fold((l) => l, (r) => r);
  }
}
