// To parse this JSON data, do
//
//     final branchManager = branchManagerFromJson(jsonString);

import 'dart:convert';

List<Branchmodel> branchManagerFromJson(String str) => List<Branchmodel>.from(
  json.decode(str).map((x) => Branchmodel.fromJson(x)),
);

String branchManagerToJson(List<Branchmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Branchmodel {
  String id;
  String name;
  String code;
  bool status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Branchmodel({
    required this.id,
    required this.name,
    required this.code,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Branchmodel.fromJson(Map<String, dynamic> json) => Branchmodel(
    id: json["_id"],
    name: json["name"],
    code: json["code"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "code": code,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
