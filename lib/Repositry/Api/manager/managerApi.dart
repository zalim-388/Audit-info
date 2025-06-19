import 'dart:convert';

import 'package:audit_info/Repositry/Api/Api_client.dart';
import 'package:audit_info/Repositry/model/manager_model.dart';

class ManagerApi {
  ApiClient api = ApiClient();

  Future<List<Managermodel>> getManager() async {
    String trendingpath = "manager/get";
    try {
      final response = await api.invokeAPI(trendingpath, "GET", "");
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((e) => Managermodel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to fetch manager: $e');
    }
  }

  Future<void> addManager(Map<String, dynamic> managerData) async {
    String trendingpath = "manager/create";
    try {
      final String body = jsonEncode(managerData);
      print("add manager$body");
      await api.invokeAPI(trendingpath, "POST", body);
    } catch (e) {
      throw Exception('Failed to add manager: $e');
    }
  }

  Future<void> deleteManager(String id) async {
    String trendingpath = "manager/delete/$id";
    try {
      await api.invokeAPI(trendingpath, "DELETE", "");
    } catch (e) {
      throw Exception('Failed to delete manager: $e');
    }
  }

  Future<void> updatemanger(Map<String, dynamic> updatedata, String id) async {
    String trendingpath = "manager/update/$id";
    final String body = jsonEncode(updatedata);
    print("updatemanager$body");
    try {
      await api.invokeAPI(trendingpath, "PUT", body);
    } catch (e) {
      throw Exception("Failed to update: $e");
    }
  }
}
