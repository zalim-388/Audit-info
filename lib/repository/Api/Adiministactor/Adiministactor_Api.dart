import 'dart:convert';

import 'package:audit_info/repository/Api/Api_client.dart';
import 'package:audit_info/repository/model/Adiministactor.dart';

class AdiministactorApi {
  ApiClient Api = ApiClient();

  Future<List<Adiministactormodel>> getAdiministactor() async {
    String trendingpath = "administractor/get";
    try {
      final response = await Api.invokeAPI(trendingpath, "GET", "");
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((e) => Adiministactormodel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to fetch adiministactor: $e');
    }
  }

  Future<void> AddAdimini(Map<String, dynamic> adiminiData) async {
    String trendingpath = "administractor/create";
    try {
      final body = await jsonEncode(adiminiData);
      await Api.invokeAPI(trendingpath, "POST", body);
    } catch (e) {
      throw Exception('Failed to add adiministactor: $e');
    }
  }

  Future<void> DeleteAdimini(String id) async {
    String trendingpath = "administractor/delete/$id";
    try {
      await Api.invokeAPI(trendingpath, "DELETE", "");
    } catch (e) {
      throw Exception('Failed to delete adiministactor: $e');
    }
  }

  Future<void> UpdateAdimini(String id, Map<String, dynamic> updatedata) async {
    String trendingpath = "administractor/update/$id";
    final String body = jsonEncode(updatedata);
    try {
      await Api.invokeAPI(trendingpath, "PUT", body);
    } catch (e) {
      throw Exception('Failed to update adiministactor: $e');
    }
  }
}
