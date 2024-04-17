import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class MessagesBack {
  Crud crud;
  MessagesBack(this.crud);
  sendMessage(var token, Map data) async {
    var response = await crud.requestDataWithHeaders(
        AppLinks.sendMessage,
        data,
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
  sendImage(var token, Map data,var image) async {
    var response = await crud.requestDataWithHeaders(
        AppLinks.sendMessage,
        data,
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        true,
        true,
        image);
    return response.fold((l) => l, (r) => r);
  }

  getMessages(var token, String id) async {
    var response = await crud.requestDataWithHeaders(
        AppLinks.getMessages + id + "/messages",
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  readMessages(String token, String id) async {
    var response = await crud.putData(
        AppLinks.readMessages + "/" + id + "/read",
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'});
    return response.fold((l) => l, (r) => r);
  }
}
