import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';
class CategoriesBack {
  Crud crud;
  CategoriesBack.CategoryContentBack(this.crud);

  postData(String category,var token,var language) async {
    var response = await crud.requestDataWithHeaders(
      '${AppLinks.jobs}?category=$category&lang=$language',{},
      {'Authorization': 'Bearer $token'},
      false,
      false,
      null
    );
    return response.fold((l) => l, (r) => r);
  }
}