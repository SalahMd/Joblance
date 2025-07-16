import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class ReportBack {
  Crud crud;
  ReportBack(this.crud);
  postData(
    Map data,
    var token,
  ) async {
    var response = await crud.postAndGetData(AppLinks.sendReport, data,
        {'Authorization': 'Bearer $token',"accept": "application/json"}, null, true, false, null);
    return response.fold((l) => l, (r) => r);
  }
}
