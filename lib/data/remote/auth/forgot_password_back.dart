import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class ForgotPasswordBack {
  Crud crud;
  ForgotPasswordBack(this.crud);
  sendCode(String email, ) async {
    var response = await crud.requestData(
            AppLinks.emailVerificationForPassword,
        {
          "email": email,
        },
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  checkCode(String email, String code, String checkFor) async {
    var response = await crud.requestData(
        checkFor == "forgot_password"
            ? AppLinks.checkCodeForPassword
            : AppLinks.checkCodeForSignUp,
        {
          "email": email,
          "code": code,
        },
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  resetPassword(String password, String email) async {
    var response = await crud.requestData(AppLinks.resetPassword,
        {"password": password, "email": email}, true, false, null);
    return response.fold((l) => l, (r) => r);
  }
  resendCode(String email,String codeFor)async{
     var response = await crud.requestData(
          codeFor =="forgot_password"?
            AppLinks.resendCodeForPassword:AppLinks.resendCodeSignup,
           
        {
          "email": email,          
        },
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
