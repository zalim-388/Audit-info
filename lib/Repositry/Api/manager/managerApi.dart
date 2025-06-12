import 'dart:convert';
import 'package:http/http.dart';

import 'package:audit_info/Repositry/Api/Api_client.dart';
import 'package:audit_info/Repositry/model/manager_model.dart';

class ManagerApi {
  ApiClient api = ApiClient();

  Future<List<Managermodel>> getManager() async {
    String trendingpath = "manager/get";
    var body = "";
    try {
      Response response = await api.invokeAPI(body, "GET", trendingpath);
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Managermodel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch managers: $e');
    }
  }

  Future<void> addManager(Map<String, dynamic> managerdata) async {
    String trendingpath = "manager/create";
    // var body = "";
    try {
      final String body = jsonEncode(managerdata);
      await api.invokeAPI(trendingpath, "POST", body);
    } catch (e) {
      throw Exception('Failed to addmanager: $e');
    }
  }

  Future<void> DeleteManager(String id) async {
    String trendingpath = "manager/delete/$id";
    var body = "";
    try {
      await api.invokeAPI(trendingpath, "DELETE", body);
    } catch (e) {
      throw Exception('Failed to delete: $e');
    }
  }
}
