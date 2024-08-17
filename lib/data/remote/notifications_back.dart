import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class NotificationsBack {
  Crud crud;
  NotificationsBack(this.crud);
   getData(
    String token,
  ) async {
    var response = await crud.postAndGetData(
        AppLinks.notification,
        {},
        {'Authorization': 'Bearer $token', "accept": "application/json"},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
