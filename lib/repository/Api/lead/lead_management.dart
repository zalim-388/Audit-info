import 'dart:convert';

import 'package:audit_info/repository/Api/Api_client.dart';
import 'package:audit_info/repository/model/lead_management.dart';

class LeadManagementApi {
  ApiClient api = ApiClient();

  Future<List<LeadManagementModel>> getLeadManagement() async {
    String trendingpath = "lead/get";

    try {
      final response = await api.invokeAPI(trendingpath, "GET", "");
      final List<dynamic> Data = jsonDecode(response.body);
      return Data.map((e) => LeadManagementModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to fecth lead :$e");
    }
  }

  Future<void> Addlead(Map<String, dynamic> leaddata) async {
    String trendingpath = "lead/create";
    try {
      final String body = jsonEncode(leaddata);
      await api.invokeAPI(trendingpath, "POST", body);
    } catch (e) {
      throw Exception("Failed to add lead :$e");
    }
  }

  Future<void> deletelead(String id) async {
    String trendingpath = "lead/delete/$id";
    try {
      await api.invokeAPI(trendingpath, "DELETE", "");
    } catch (e) {
      throw Exception("Failed to delete lead :$e");
    }
  }

  Future<void> updatelead(Map<String, dynamic> leaddata, dynamic id) async {
    String trendingpath = "lead/update/$id";
    try {
      final String body = jsonEncode(leaddata);
      await api.invokeAPI(trendingpath, "PUT", body);
      print("update src$body");
    } catch (e) {
      throw Exception("Failed to update lead :$e");
    }
  }
}
