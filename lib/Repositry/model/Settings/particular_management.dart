
// To parse this JSON data, do
//
//     final particularManagementModel = particularManagementModelFromJson(jsonString);

import 'dart:convert';

List<ParticularManagementModel> particularManagementModelFromJson(String str) => List<ParticularManagementModel>.from(json.decode(str).map((x) => ParticularManagementModel.fromJson(x)));

String particularManagementModelToJson(List<ParticularManagementModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ParticularManagementModel {
    String id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    ParticularManagementModel({
        required this.id,
        required this.name,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory ParticularManagementModel.fromJson(Map<String, dynamic> json) => ParticularManagementModel(
        id: json["_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
