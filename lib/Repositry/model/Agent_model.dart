// To parse this JSON data, do
//
//     final agentModel = agentModelFromJson(jsonString);

import 'dart:convert';

List<AgentModel> agentModelFromJson(String str) =>
    List<AgentModel>.from(json.decode(str).map((x) => AgentModel.fromJson(x)));

String agentModelToJson(List<AgentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AgentModel {
  String id;
  String name;
  String? email;
  int phoneNumber;
  String address;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  AgentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    address: json["address"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "phone_number": phoneNumber,
    "address": address,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
