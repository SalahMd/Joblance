import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class Conversations {
  Crud crud;
  Conversations(this.crud);
  getConversations(
    var token,
  ) async {
    var response = await crud.requestDataWithHeaders(
        AppLinks.getConversations,
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
