import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class LoginBack {
  Crud crud;
  LoginBack(this.crud);
  login(String email, String password) async {
    var response = await crud.requestData(
        AppLinks.logIn,
        {
          "email": email,
          "password": password,
        },
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  googleLogin(String token) async {
    var response = await crud.requestData(
        AppLinks.googleSignin,
        {
          "token": token,
        },
        true,
        false,
        null);
  }
}
