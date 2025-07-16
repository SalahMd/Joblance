import 'dart:io';

import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class ApplayJobBack {
  Crud crud;
  ApplayJobBack(this.crud);
  postData(Map data, String token, File CV) async {
    var response = await crud.postAndGetData(
        AppLinks.applayJob,
        data,
        {'Authorization': 'Bearer $token', "accept": "application/json"},
        "CV",
        true,
        true,
        CV);
    print(response.toString() +
        "/////////////////////////////////////////////////////////");
    return response.fold((l) => l, (r) => r);
  }
}
