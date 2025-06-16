import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:audit_info/Repositry/model/manager_model.dart';
import 'package:audit_info/Repositry/Api/Api_client.dart';

class ManagerApi {
  ApiClient api = ApiClient();

  Future<List<Managermodel>> getManager() async {
    String path = "manager/get";
    try {
      final response = await api.invokeAPI(path, "GET", "");
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((e) => Managermodel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to fetch manager: $e');
    }
  }

  Future<void> addManager(Map<String, dynamic> managerData) async {
    String path = "manager/create";
    try {
      final String body = jsonEncode(managerData);
      await api.invokeAPI(path, "POST", body);
    } catch (e) {
      throw Exception('Failed to add manager: $e');
    }
  }

  Future<void> deleteManager(String id) async {
    String path = "manager/delete/$id";
    try {
      await api.invokeAPI(path, "DELETE", "");
    } catch (e) {
      throw Exception('Failed to delete manager: $e');
    }
  }
}
