import 'dart:convert';

import 'package:audit_info/Repositry/Api/Api_client.dart';
import 'package:audit_info/Repositry/model/accountant_modal.dart';
import 'package:http/http.dart';

class Accountantapi {
  ApiClient api = ApiClient();
  Future<AccountantModel> getAccountant() async {
    String trendingpath = "accountant/get/";
    var body = "";
    try {
      Response response = await api.invokeAPI(trendingpath, "GET", body);
      return AccountantModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception('Failed to load accountant: $e');
    }
  }

  Future<void> AddAccount(Map<String, dynamic> Accountdata) async {
    String trendingpath = "accountant/create";
    var body = "";
    try {
      final String body = jsonEncode(Accountdata);
      await api.invokeAPI(trendingpath, "post", body);
    } catch (e) {
      throw Exception('Failed to post: $e');
    }
    Future<void> deleteaccount(
      String id,

    ) async {
      String trendingpath = "accountant/delete/$id";

      try {
        await api.invokeAPI(trendingpath, "DELETE", "");
      } catch (e) {
        throw Exception('Failed to delete: $e');
      }
    }
  }
}
