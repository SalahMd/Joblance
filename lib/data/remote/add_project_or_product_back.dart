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
    var response = await crud.postAndGetData(AppLinks.project, data,
        {'Authorization': 'Bearer $token'}, "images", true, true, files);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(
    String id,
    var token,
  ) async {
    var response = await crud.deleteData(
      AppLinks.project+"/"+id,
      {},
      {'Authorization': 'Bearer $token'},
    );
    return response.fold((l) => l, (r) => r);
  }

  updateData(Map data, var token, String id, var images) async {
    var response = await crud.putData(
        AppLinks.project+"/"+id,
        data,
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        "images_add",
        true,
        images);
    return response.fold((l) => l, (r) => r);
  }

  getData(
    Map data,
    String link,
    var token,
  ) async {
    var response = await crud.postAndGetData(link, data,
        {'Authorization': 'Bearer $token',"accept":"application/json"}, null, false, false, null);
    return response.fold((l) => l, (r) => r);
  }
}
