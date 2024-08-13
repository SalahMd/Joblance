import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class JobBack {
  Crud crud;
  JobBack(this.crud);

  getData(String token, String link) async {
    var response = await crud.postAndGetData(
        link,
        {},
        {'Authorization': 'Bearer $token', "accept": "application/json"},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  postData(String token, Map data) async {
    var response = await crud.postAndGetData(
        AppLinks.jobInfo,
        data,
        {'Authorization': 'Bearer $token', "accept": "application/json"},
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  updateData(String token, String id, Map data) async {
    var response = await crud.putData(
      AppLinks.jobInfo + "/" + id,
      data,
      {
        'Authorization': 'Bearer $token',
      },
      null,
      false,
      null,
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteData(
    String id,
    String token,
  ) async {
    var response = await crud.deleteData(
      AppLinks.jobInfo + "/" + id,
      {},
      {'Authorization': 'Bearer $token'},
    );
    return response.fold((l) => l, (r) => r);
  }

  addToImportantJobs(
    String id,
    String token,
  ) async {
    var response = await crud.postAndGetData(
        AppLinks.importantJob,
        {},
        {'Authorization': 'Bearer $token', "accept": "application/json"},
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
