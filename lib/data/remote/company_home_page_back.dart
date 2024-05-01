import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class CompanyHomePageBack {
  Crud crud;
  CompanyHomePageBack(this.crud);

  getFreeLancers(var token, String language) async {
    var response = await crud.requestDataWithHeaders(
        AppLinks.freelancers + language,
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
}
