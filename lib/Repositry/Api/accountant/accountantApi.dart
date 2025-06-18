import 'dart:convert';

import 'package:audit_info/Repositry/Api/Api_client.dart';
import 'package:audit_info/Repositry/model/accountant_modal.dart';
import 'package:http/http.dart';

class Accountantapi {
  ApiClient api = ApiClient();

  Future<List<AccountantModel>> getAccountant() async {
    String trendingpath = "accountant/get/";
    try {
      Response response = await api.invokeAPI(trendingpath, "GET", "");
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => AccountantModel.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Failed to load accountant: $e');
    }
  }

  Future<void> AddAccount(Map<String, dynamic> Accountdata) async {
    String trendingpath = "accountant/create";
    try {
      final String body = jsonEncode(Accountdata);
      print("Addddd  $body");
      await api.invokeAPI(trendingpath, "POST", body);
    } catch (e) {
      throw Exception('Failed to post: $e');
    }
  }

  Future<void> deleteaccount(String id) async {
    String trendingpath = "accountant/delete/$id";
    try {
      await api.invokeAPI(trendingpath, "DELETE", "");
    } catch (e) {
      throw Exception('Failed to delete: $e');
    }
  }

  Future<void> updateAccount(
    Map<String, dynamic> updatedData,
    String id,
  ) async {
    String trendingpath = "accountant/update/$id";
    final String body = jsonEncode(updatedData);
    print("update Account$body");
    try {
      await api.invokeAPI(trendingpath, "PUT", body);
    } catch (e) {
      throw Exception('Failed to update: $e');
    }
  }
}
