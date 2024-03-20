import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';
class ProfileBack {
  Crud crud;
  ProfileBack.ProfileBack(this.crud);

  postData(String category,var token,var language) async {
    var response = await crud.requestDataWithHeaders(
      AppLinks.jobs,
      {'Authorization': 'Bearer $token'},{},
      false,
      false,
      null
    );
    return response.fold((l) => l, (r) => r);
  }
}