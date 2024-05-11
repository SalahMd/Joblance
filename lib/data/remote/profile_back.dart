import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';
class ProfileBack {
  Crud crud;
  ProfileBack(this.crud);

  getData(var token,String id) async {
    var response = await crud.requestDataWithHeaders(
      AppLinks.profile+id,
      {
        },{'Authorization': 'Bearer $token',},
      null,
      false,
      false,
      null
    );
    return response.fold((l) => l, (r) => r);
  }
    getSkills(String link, var token,String id) async {
    var response = await crud.requestDataWithHeaders(
        //"${AppLinks.skills}?search=$skill",
        link,
        {
          "user_id":id,
        },
        {
          'Authorization': 'Bearer $token',
        },
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}