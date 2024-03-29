import 'dart:io';

import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class SignUpBack {
  Crud crud;
  SignUpBack(this.crud);
  signUp(Map data, File image) async {
    var response =
        await crud.requestData(AppLinks.signUp, data, true, true, image);
    return response.fold((l) => l, (r) => r);
  }

  googleSignUp(Map data,)async{
    var response =
        await crud.requestData(AppLinks.IP,data,true,false,null);
         return response.fold((l) => l, (r) => r);
  }
}
