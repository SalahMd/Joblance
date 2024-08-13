import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class BudgetBack {
  Crud crud;
  BudgetBack(this.crud);

  getData(String token, String id) async {
    var response = await crud.postAndGetData(
        AppLinks.budget + "/" + id,
        {},
        {'Authorization': 'Bearer $token', "accept": "application/json"},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  getTransactions(
      String token, String lang, String id, String year, String month) async {
    var response = await crud.postAndGetData(
        AppLinks.transactions +
            "/" +
            id +
            "/transactions" +
            "?year=" +
            year +
            "&month=" +
            month +
            "&lang=" +
            lang,
        {},
        {'Authorization': 'Bearer $token', "accept": "application/json"},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
