import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class TaskBack {
  Crud crud;
  TaskBack(this.crud);
  postData(
    Map data,
    var token,
  ) async {
    var response = await crud.postAndGetData(AppLinks.task, data,
        {'Authorization': 'Bearer $token'}, null, true, false, null);
    return response.fold((l) => l, (r) => r);
  }

  getData(
    Map data,
    String link,
    var token,
  ) async {
    var response = await crud.postAndGetData(
        link,
        data,
        {'Authorization': 'Bearer $token', "accept": "application/json"},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  updateData(Map data, var token, String id, var images) async {
    var response = await crud.putData(
        AppLinks.task + "/" + id,
        data,
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
  deleteData(
    String id,
    var token,
  ) async {
    var response = await crud.deleteData(
      AppLinks.task+"/"+id,
      {},
      {'Authorization': 'Bearer $token'},
    );
    return response.fold((l) => l, (r) => r);
  }
}
