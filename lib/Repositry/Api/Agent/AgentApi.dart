import 'dart:convert';

import 'package:audit_info/Repositry/Api/Api_client.dart';
import 'package:audit_info/Repositry/model/Agent_model.dart';

class Agentapi {
  ApiClient api = ApiClient();

  Future<List<AgentModel>> getAgent() async {
    String trendingpath = "agent/get";
    try {
      final response = await api.invokeAPI(trendingpath, "GET","");
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((e) => AgentModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to fetch agent: $e');
    }
  }

Future<void> addAgent(Map<String, dynamic> agentData) async {
    String trendingPath = "agent/create";
    try {
      final body = jsonEncode(agentData);
      print('Add agent request: $body');
      final response = await api.invokeAPI(trendingPath, "POST", body);
      print('Add agent response: ${response.statusCode} ${response.body}');
      if (response.statusCode != 201) {
        final error = jsonDecode(response.body)['message'] ?? 'Unknown error';
        throw Exception('Failed to add agent: $error (Status: ${response.statusCode})');
      }
    } catch (e) {
      print('Add agent error: $e');
      throw Exception('Failed to add agent: $e');
    }
  }
  Future<void> deleteAgent(String id) async {
    String tringingpath = "agent/delete/$id";

    try {
      await api.invokeAPI(tringingpath,"DELETE","");
    } catch (e) {
      throw Exception('Failed to delete agent: $e');
    }
  }

  Future<void> updateAgent(String id, Map<String, dynamic> updatedata) async {
    String tringingpath = "agent/update/$id";
    final String body = jsonEncode(updatedata);

    try {
      await api.invokeAPI(tringingpath, "PUT", body);
    } catch (e) {
      throw Exception('Failed to update agent: $e');
    }
  }
}
