import 'dart:convert';

import 'package:audit_info/Repositry/Api/Api_client.dart';
import 'package:audit_info/Repositry/model/BranchManager.dart' show Branchmodel;
import 'package:audit_info/ui/Branch_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class BranchmanagerApi {
  ApiClient api = ApiClient();
  Future<Branchmodel> getBranchManager() async {
    String path = "branch/get";
    var body = "";

    Response response = await api.invokeAPI(body, "GET", Path);
    return Branchmodel.fromJson(jsonDecode(response.body));
  }
}
