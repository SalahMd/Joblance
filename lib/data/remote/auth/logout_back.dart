import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class LogOutBack {
  Crud crud;
  LogOutBack(this.crud);
  postData(var token) async {
    var response = await crud.requestDataWithHeaders(AppLinks.logOut, {},
        {'Authorization': 'Bearer $token'}, true, false, null);
    return response.fold((l) => l, (r) => r);
  }
}
