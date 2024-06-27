import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class CompanyHomePageBack {
  Crud crud;
  CompanyHomePageBack(this.crud);

  getFreeLancers(var token, String language) async {
    var response = await crud.postAndGetData(
        AppLinks.freelancers + "?lang=" + language,
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

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

  getCompanyInfo(var token, String language, String id) async {
    var response = await crud.postAndGetData(
        AppLinks.profile + id + "?lang=" + language,
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
