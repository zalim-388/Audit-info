import 'dart:convert';
import 'dart:developer';

import 'package:audit_info/Repositry/Api/Api_Exception.dart';
import 'package:audit_info/main.dart';
import 'package:http/http.dart';

class ApiClient {
  Future<Response> invokeAPI(String path, String method, Object? body) async {
    Response response;

    String url = baseurl + path;

    print(url);
    print(body);

    switch (method) {
      case "POST":
        response = await post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          }, // Change to application/json
          body: body,
        );
        break;
      case "PUT":
        response = await put(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
        break;
      case "DELETE":
        response = await delete(Uri.parse(url), headers: {}, body: body);
        break;
      case "POST_":
        response = await post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
        break;
      case "GET_":
        response = await post(Uri.parse(url), headers: {}, body: body);
        break;

      case "PATCH":
        response = await patch(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
        break;
      default:
        response = await get(
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

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers['content-type'];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'] ?? response.body;
    } else {
      return response.body;
    }
  }
}
