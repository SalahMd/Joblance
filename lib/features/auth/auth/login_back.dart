import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class LoginBack {
  Crud crud;
  LoginBack(this.crud);
  login(Map data) async {
    var response = await crud.postAndGetData(
        AppLinks.logIn, data, {}, null, true, false, null);
    return response.fold((l) => l, (r) => r);
  }

  googleLogin(Map data) async {
    var response = await crud.postAndGetData(
        AppLinks.googleSignin, data, {"accept": "application/json"}, null, true, false, null);
    return response.fold((l) => l, (r) => r);
  }
}
