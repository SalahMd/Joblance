import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class FreelancerAccount {
  Crud crud;
  FreelancerAccount(this.crud);

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

  addSkill(var token, Map data,String link) async {
    var response = await crud.postAndGetData(
        link,
        data,
        {
          'Authorization': 'Bearer $token',
        },
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  deleteSkill(String token, String id) async {
    var response = await crud.deleteData(
      AppLinks.skills + "/" + id,
      {},
      {'Authorization': 'Bearer $token', 'accept': 'application/json'},
    );
    return response.fold((l) => l, (r) => r);
  }
}
