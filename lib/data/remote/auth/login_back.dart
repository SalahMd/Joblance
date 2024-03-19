import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class LoginBack {
  Crud crud;
  LoginBack(this.crud);
  postData(String phone, String password) async {
    var response = await crud.postData(AppLinks.logIn, {
      "email":phone,
      "password":password,
    },true);
    return response.fold((l) => l, (r) => r);
  }
}
