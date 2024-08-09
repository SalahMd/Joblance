import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class BudgetBack {
  Crud crud;
  BudgetBack(this.crud);

  getData(
    var token,
    String id
  ) async {
    var response = await crud.postAndGetData(
        AppLinks.budget+"/"+id,
        {},
        {'Authorization': 'Bearer $token', "accept": "application/json"},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
