import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class LogOutBack {
  Crud crud;
  LogOutBack(this.crud);
  postData(var token) async {
    var response = await crud.postAndGetData(
        AppLinks.logOut,
        {},
        {'Authorization': 'Bearer $token', "accept": "application/json"},
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  deleteAccount(String link, String token, String id) async {
    var response = await crud.deleteData(
      link + "/" + id,
      {},
      {'Authorization': 'Bearer $token', "accept": "application/json"},
    );
    return response.fold((l) => l, (r) => r);
  }
}
