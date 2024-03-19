import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:joblance/core/class/statusrequest.dart';

class Crud {
  Future<Either<StatusRequest, Map>> requestData(
      String linkurl, Map data, bool isPost, bool isFile, File? file) async {
    try {
      var response;
      //Posting with file
      if (isFile && isPost) {
        var request = http.MultipartRequest('POST', Uri.parse(linkurl));
        // Add file to the request
        if (file != null) {
          http.Response imageResponse = await http.get(Uri.parse(file.path));
          request.files.add(http.MultipartFile.fromBytes(
              'image', imageResponse.bodyBytes,
              filename: 'image.jpg'));
        }
        data.forEach((key, value) {
          request.fields[key] = value;
        });
        var myRequest = await request.send();
        response = await http.Response.fromStream(myRequest);
      }
      //Posting without file
      else if (isPost && !isFile) {
        response = await http.post(Uri.parse(linkurl), body: data);
      }
      //Getting without a file
      else if (!isPost && !isFile) {
        response = await http.get(
          Uri.parse(linkurl),
        );
      }
      //Checking the code status
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

  Future<Either<StatusRequest, Map>> requestDataEithHeaders(
      String linkurl,
      Map data,
      Map<String, String> headers,
      bool isPost,
      bool isFile,
      File? file) async {
    var response;
    try {
      //Posting with  file
      if (isFile && isPost) {
        var request = http.MultipartRequest('POST', Uri.parse(linkurl));
        request.headers.addAll(headers);
        // Add file to the request
        if (file != null) {
          http.Response imageResponse = await http.get(Uri.parse(file.path));
          request.files.add(http.MultipartFile.fromBytes(
              'image', imageResponse.bodyBytes,
              filename: 'image.jpg'));
        }
        data.forEach((key, value) {
          request.fields[key] = value;
        });
        var myRequest = await request.send();
        response = await http.Response.fromStream(myRequest);
      }
      //Posting without a file
      else if (isPost && !isFile) {
        response =
            await http.post(Uri.parse(linkurl), body: data, headers: headers);
      }
      //Getting data
      else if (!isPost && !isFile) {
        response = await http.get(Uri.parse(linkurl), headers: headers);
      }
      //Checking the code status
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        return right(responseBody);
      } else {
        print(response);
        return left(StatusRequest.serverError);
      }
    } catch (_) {
      return left(StatusRequest.serverError);
    }
  }
}
