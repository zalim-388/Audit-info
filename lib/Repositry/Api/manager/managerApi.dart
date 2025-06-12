import 'dart:convert';
import 'package:http/http.dart';

import 'package:audit_info/Repositry/Api/Api_client.dart';
import 'package:audit_info/Repositry/model/manager_model.dart';

class Managerapi {
  ApiClient Api = ApiClient();
  Future<Managermodel> getManager() async {
    String trendingpath = "manager/get";
    var body = "";
    Response response = await Api.invokeAPI(body, "GET", trendingpath);
    return Managermodel.fromJson(jsonDecode(response.body));
  }
}
