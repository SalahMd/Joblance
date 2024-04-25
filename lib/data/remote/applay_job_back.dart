import 'dart:io';

import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class ApplayJobBack {
  Crud crud;
  ApplayJobBack(this.crud);
  postData(Map data,var token,File CV) async {
    var response = await crud.requestDataWithHeaders(
        AppLinks.applayJob,
        data,
        {'Authorization': 'Bearer $token'},
                "CV",

        true,true,CV);
    return response.fold((l) => l, (r) => r);
  }
}
