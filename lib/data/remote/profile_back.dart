import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';
class ProfileBack {
  Crud crud;
  ProfileBack(this.crud);

  postData(var token,String id) async {
    var response = await crud.requestDataWithHeaders(
      AppLinks.profile+id.toString(),
      {'Authorization': 'Bearer $token',},{},
      false,
      false,
      null
    );
    return response.fold((l) => l, (r) => r);
  }
}