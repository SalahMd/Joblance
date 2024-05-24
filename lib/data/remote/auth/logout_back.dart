import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class LogOutBack {
  Crud crud;
  LogOutBack(this.crud);
  postData(var token) async {
    var response = await crud.postAndGetData(AppLinks.logOut, {},
        {'Authorization': 'Bearer $token'}, null, true, false, null);
    return response.fold((l) => l, (r) => r);
  }

  deleteAccount(String token, String id) async {
    var response = await crud.deleteData(
      AppLinks.user + "/" + id,
      {},
      {'Authorization': 'Bearer $token'},
    );
    return response.fold((l) => l, (r) => r);
  }
}
