import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class MessagesBack {
  Crud crud;
  MessagesBack(this.crud);
  sendMessage(var token, Map data) async {
    var response = await crud.postAndGetData(
        AppLinks.sendMessage,
        data,
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  sendFile(var token, Map data, var image, String fileName) async {
    var response = await crud.postAndGetData(
        AppLinks.sendMessage,
        data,
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        fileName,
        true,
        true,
        image);
    return response.fold((l) => l, (r) => r);
  }

  getMessages(var token, String id) async {
    var response = await crud.postAndGetData(
        AppLinks.getMessages + id + "/messages",
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  readMessages(String token, String id) async {
    var response = await crud.putData(
        AppLinks.readMessages + "/" + id + "/read",
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  deleteMessage(var token, String id, String target) async {
    var response = await crud.deleteData(
      AppLinks.deleteMessage + id + "/delete",
      {"target": target},
      {'Authorization': 'Bearer $token', 'accept': 'application/json'},
    );
    return response.fold((l) => l, (r) => r);
  }
}
