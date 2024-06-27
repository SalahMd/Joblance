import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class SearchBack {
  Crud crud;
  SearchBack(this.crud);
  getMajor(String token, String language) async {
    var response = await crud.postAndGetData(
        AppLinks.major + "?lang=" + language,
        {},
        {'Authorization': 'Bearer $token'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
   getExperience(String token, String language) async {
    var response = await crud.postAndGetData(
        AppLinks.jobExperience + "?lang=" + language,
        {},
        {'Authorization': 'Bearer $token'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
