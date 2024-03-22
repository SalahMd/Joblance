import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class ForgotPasswordBack {
  Crud crud;
  ForgotPasswordBack(this.crud);
  sendCode(String email) async {
    var response = await crud.requestData(
        AppLinks.emailVerification,
        {
          "email": email,
        },
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  checkCode(String email, String code) async {
    var response = await crud.requestData(
        AppLinks.checkCode,
        {
          "email": email,
          "code": code,
        },
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  resetPassword(
    String password,
    String email
  ) async {
    var response = await crud.requestData(
        AppLinks.resetPassword,
        {
          "password": password,
          "email":email
        },
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
