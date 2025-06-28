import 'dart:convert';

import 'package:audit_info/Repositry/Api/Api_client.dart';
import 'package:audit_info/Repositry/model/Settings/BranchManagement.dart';


import 'package:http/http.dart';

class BranchmanagerApi {
  ApiClient api = ApiClient();
  Future<Branchmodel> getBranchManager() async {
    String trendingpath = "branch/get";
    var body = "";

    Response response = await api.invokeAPI(body, "GET", trendingpath);
    return Branchmodel.fromJson(jsonDecode(response.body));
  }
}
