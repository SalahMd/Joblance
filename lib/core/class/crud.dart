import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:joblance/core/class/statusrequest.dart';
import 'package:joblance/core/functions/checkinternet.dart';
import 'package:path/path.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postAndGetData(
      String linkurl,
      Map data,
      Map<String, String> headers,
      String? fileName,
      bool isPost,
      bool isFile,
      var file) async {
    try {
      if (await checkInternet()) {
        var response;
        // Check if the request is a POST with a file
        if (isFile && isPost && file != null) {
          var request = http.MultipartRequest('POST', Uri.parse(linkurl));

          String name = fileName == null ? "image" : fileName;

          for (int i = 0; i < file.length; i++) {
            var length = await file[i].length();
            var stream = http.ByteStream(file[i].openRead());

            var multiPartFile = http.MultipartFile(
                name == "images" ? name + "[$i]" : name, stream, length,
                filename: basename(file[i].path));
            request.files.add(
              multiPartFile,
            );
          }

          request.headers.addAll(headers);

          data.forEach((key, value) {
            request.fields[key] = value.toString();
          });
          var myRequest = await request.send();
          response = await http.Response.fromStream(myRequest);
          print(response.body);
        }
        // Handle other types of requests
        else if (isPost && !isFile) {
          response =
              await http.post(Uri.parse(linkurl), body: data, headers: headers);
        } else if (!isPost && !isFile) {
          response = await http.get(Uri.parse(linkurl), headers: headers);
          print(response.body);
        }

        // Check the code status
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return right(responseBody);
        } else {
          //animationedAlert(AppAnimations.noInternet, "nointernetconnection");
          return left(StatusRequest.serverError);
        }
      } else {
        return left(StatusRequest.offline);
      }
    } catch (_) {
      return left(StatusRequest.serverError);
    }
  }

  Future<Either<StatusRequest, Map>> putData(
      String linkurl,
      Map data,
      Map<String, String> headers,
      String? fileName,
      bool isFile,
      var file) async {
    try {
      if (true) {
        var response;
        if (isFile && file != null) {
          String name = fileName == null ? "image" : fileName;
          var request = http.MultipartRequest('PUT', Uri.parse(linkurl));

          for (int i = 0; i < file.length; i++) {
            var length = await file[i].length();
            var stream = http.ByteStream(file[i].openRead());

            var multiPartFile = http.MultipartFile(
                name == "images" ? name + "[$i]" : name, stream, length,
                filename: basename(file[i].path));
            request.files.add(
              multiPartFile,
            );
          }
          request.headers.addAll(headers);
          data.forEach((key, value) {
            request.fields[key] = value.toString();
          });
          var myRequest = await request.send();
          response = await http.Response.fromStream(myRequest);
          print(response.body);
        } else {
          response =
              await http.put(Uri.parse(linkurl), body: data, headers: headers);
          print(response.body);
        }
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return right(responseBody);
        } else {
          return left(StatusRequest.serverError);
        }
      } else {
        return left(StatusRequest.offline);
      }
    } catch (_) {
      return left(StatusRequest.serverError);
    }
  }

  Future<Either<StatusRequest, Map>> deleteData(
    String linkurl,
    Map data,
    Map<String, String> headers,
  ) async {
    try {
      if (await checkInternet()) {
        var response;
        response =
            await http.delete(Uri.parse(linkurl), body: data, headers: headers);
        print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return right(responseBody);
        } else {
          return left(StatusRequest.serverError);
        }
      } else {
        return left(StatusRequest.offline);
      }
    } catch (_) {
      return left(StatusRequest.serverError);
    }
  }
}
