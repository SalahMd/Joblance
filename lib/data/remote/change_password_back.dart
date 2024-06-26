import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class ChangePasswordBack {
  Crud crud;
  ChangePasswordBack(this.crud);
  changePassword(String oldPassword, String newPassword, var token) async {
    var response = await crud.postAndGetData(
        AppLinks.changePassword,
        {
          "old_password": oldPassword,
          "new_password": newPassword,
        },
        {'Authorization': 'Bearer $token'},
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
