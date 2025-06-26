import 'dart:convert';

import 'package:audit_info/Repositry/Api/Api_client.dart';
import 'package:audit_info/Repositry/model/SRO_model.dart';

class Sroapi {
  ApiClient api = ApiClient();

  Future<List<SroModel>> getsro() async {
    String trendingpath = "sro/get";
    try {
      final response = await api.invokeAPI(trendingpath, "GET", "");
      if (response.statusCode == 200) {
        return sroModelFromJson(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getsro: $e');
      throw Exception("Failed to fetch sro: $e");
    }
  }

  
  Future<void> AddSro(Map<String, dynamic> srodata) async {
    String trendingpath = "sro/create";
    try {
      final String body = jsonEncode(srodata);
      await api.invokeAPI(trendingpath, "POST", body);
    } catch (e) {
      throw Exception("Failed to Add sro$e");
    }
  }

  Future<void> deletesro(String id) async {
    String trendingpath = "sro/delete/$id";

    try {
      await api.invokeAPI(trendingpath, "PUT", "");
    } catch (e) {
      throw Exception("Failed to DELETE sro:$e");
    }
  }

  Future<void> updatesro(String id, Map<String, dynamic> updatedata) async {
    String trendingpath = "sro/update/$id";
    final String body = jsonEncode(updatedata);

    try {
      await api.invokeAPI(trendingpath, "PUT", body);
    } catch (e) {
      throw Exception("Failed to  update sro:$e");
    }
  }
}
