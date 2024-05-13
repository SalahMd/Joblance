import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class AddProjectOrProductBack {
  Crud crud;
  AddProjectOrProductBack(this.crud);
  postData(
    Map data,
    List files,
    var token,
  ) async {
    var response = await crud.requestDataWithHeaders(AppLinks.project, data,
        {'Authorization': 'Bearer $token'}, "images", true, true, files);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(
    Map data,
    var token,
  ) async {
    var response = await crud.deleteData(
      AppLinks.project,
      data,
      {'Authorization': 'Bearer $token'},
    );
    return response.fold((l) => l, (r) => r);
  }

  updateData(Map data, var token, String id, var images) async {
    var response = await crud.putData(AppLinks.project, data,
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},"images",true,images);
    return response.fold((l) => l, (r) => r);
  }

  getData(
    Map data,
    String link,
    var token,
  ) async {
    var response = await crud.requestDataWithHeaders(link, data,
        {'Authorization': 'Bearer $token'}, null, false, false, null);
    return response.fold((l) => l, (r) => r);
  }
}
