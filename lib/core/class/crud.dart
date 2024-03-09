import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:joblance/core/class/statusrequest.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(
    String linkurl,
    Map data,
    bool isPost,
  ) async {
    try {
      var response;
        if (isPost) {
          response = await http.post(Uri.parse(linkurl), body: data);
        } else {
          response = await http.get(
            Uri.parse(linkurl),
          );
        }
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return right(responseBody);
        } else {
          return left(StatusRequest.serverError);
        }
      
    } catch (_) {
      return left(StatusRequest.serverError);
    }
  }

  Future<Either<StatusRequest, Map>> postWithHeaders(String linkurl, Map data,
      Map<String, String> headers, bool isPost) async {
    try {
      var response;
        if (isPost) {
          response = await http.post(Uri.parse(linkurl),
              body: jsonEncode(data), headers: headers);
        } else {
          response = await http.get(Uri.parse(linkurl), headers: headers);
        }
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return right(responseBody);
        } else {
          return left(StatusRequest.serverError);
      }
    } catch (_) {
      return left(StatusRequest.serverError);
    }
  }
}
