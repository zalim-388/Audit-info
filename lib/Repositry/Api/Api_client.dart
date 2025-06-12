import 'dart:convert';
import 'dart:developer';

import 'package:audit_info/Repositry/Api/Api_Exception.dart';
import 'package:audit_info/main.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<http.Response> invokeAPI(
    String path,
    String method,
    Object? body,
  ) async {
    http.Response response;

    String url = baseUrl + path;
    print(url);
    print(body);

    switch (method) {
      case "POST":
        response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          body: body,
        );
        break;
      case "PUT":
        response = await http.put(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
        break;
      case "DELETE":
        response = await http.delete(Uri.parse(url), headers: {}, body: body);
        break;
      case "POST_":
        response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
        break;
      case "GET_":
        response = await http.post(Uri.parse(url), headers: {}, body: body);
        break;
      case "GET":
        response = await http.get(Uri.parse(url), headers: {});
        break;
      case "PATCH":
        response = await http.patch(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
        break;
      default:
        response = await http.get(
          Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        );
    }

    print('status of $path => ${response.statusCode}');
    print(response.body);
    if (response.statusCode >= 400) {
      log('$path : ${response.statusCode} : ${response.body}');
      throw ApiException(_decodeBodyBytes(response), response.statusCode);
    }
    return response;
  }

  String _decodeBodyBytes(http.Response response) {
    var contentType = response.headers['content-type'];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'] ?? response.body;
    } else {
      return response.body;
    }
  }
}
