import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class CreateCVBack {
  Crud crud;
  CreateCVBack(this.crud);
  postData(
    Map data,
    var image,
    var token,
  ) async {
    var response = await crud.postAndGetData(AppLinks.createCV, data,
        {'Authorization': 'Bearer $token'}, "image", true, true, image);
    return response.fold((l) => l, (r) => r);
  }
}
