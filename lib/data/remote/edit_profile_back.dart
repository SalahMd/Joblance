import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class EditProfileBack {
  Crud crud;
  EditProfileBack(this.crud);

  getData(var token, String id) async {
    var response = await crud.requestDataWithHeaders(
        AppLinks.profile + id,
        
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
