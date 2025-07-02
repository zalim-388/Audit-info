import 'dart:convert';
import 'package:audit_info/repository/Api/Api_client.dart';
import 'package:audit_info/repository/model/SRCmodel.dart';

class Srcapi {
  ApiClient api = ApiClient();

  Future<List<SrcModel>> getsrc() async {
    String trendingpath = "src/get";
    try {
      final response = await api.invokeAPI(trendingpath, "GET", "");
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((s) => SrcModel.fromJson(s)).toList();
    } catch (e) {
      throw Exception("Failed to fetch src: $e");
    }
  }

  Future<void> AddSrc(Map<String, dynamic> srcdata) async {
    String trendingpath = "src/create";
    try {
      final String body = jsonEncode(srcdata);
      await api.invokeAPI(trendingpath, "POST", body);
    } catch (e) {
      throw Exception("Failed to Add src$e");
    }
  }

  Future<void> deletesrc(String id) async {
    String trendingpath = "src/delete/$id";
    try {
      await api.invokeAPI(trendingpath, "DELETE", "");
    } catch (e) {
      throw Exception("Failed to DELETE:$e");
    }
  }

  Future<void> updatesrc(Map<String, dynamic> updatedata, String id) async {
    String trendingpath = "src/update/$id";
    final String body = jsonEncode(updatedata);
    print("update src$body");

    try {
      await api.invokeAPI(trendingpath, "PUT", body);
    } catch (e) {
      throw Exception("API Src update error: $e");
    }
  }
}
