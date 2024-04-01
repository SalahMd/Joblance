import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class LoginBack {
  Crud crud;
  LoginBack(this.crud);
  login(Map data) async {
    var response = await crud.requestData(
        AppLinks.logIn,
        data,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  googleLogin(Map data) async {
    var response = await crud.requestData(
        AppLinks.googleSignin,
        data,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
