import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class CategoriesBack {
  Crud crud;
  CategoriesBack.CategoryContentBack(this.crud);

  postData(String category, var token, var language) async {
    var response = await crud.postAndGetData(
        '${AppLinks.jobs}?category=$category&lang=$language',
        {},
        {'Custom-Param': 'param_value', 'Authorization': 'Bearer $token'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
