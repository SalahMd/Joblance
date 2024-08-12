import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class ProfileBack {
  Crud crud;
  ProfileBack(this.crud);

  getData(var token, String id, String lang) async {
    var response = await crud.postAndGetData(
        AppLinks.profile + id + "?lang=" + lang,
        {},
        {
          'Authorization': 'Bearer $token',
        },
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  getSkills(String link, var token) async {
    var response = await crud.postAndGetData(
        //"${AppLinks.skills}?search=$skill",
        link,
        {
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
  getSubscription(String token)async{
      var response = await crud.postAndGetData(
        "${AppLinks.subscription}",
        
        {
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
