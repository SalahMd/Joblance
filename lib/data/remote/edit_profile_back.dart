import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class EditProfileBack {
  Crud crud;
  EditProfileBack(this.crud);

  getData(var token, String id, String language) async {
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

  updateData(
    String link,
    var token,
    String id,
    Map data,
    var image,
  ) async {
    var response = await crud.postAndGetData(
        link + "/" + id,
        data,
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        "image",
        true,
        true,
        image);
    return response.fold((l) => l, (r) => r);
  }

  getStudeCases(String token, String language) async {
    var response = await crud.postAndGetData(
        AppLinks.studyCases + "?lang=" + language,
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
