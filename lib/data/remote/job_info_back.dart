import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class JobBack {
  Crud crud;
  JobBack(this.crud);

  getData(var token, String link) async {
    var response = await crud.postAndGetData(
       link,
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

  postData(var token, Map data) async {
    var response = await crud.postAndGetData(
        AppLinks.jobInfo,
        data,
        {
          'Authorization': 'Bearer $token',
        },
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  updateData(var token, String id, Map data) async {
    var response = await crud.putData(
        AppLinks.jobInfo +"/"+ id,
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
}
