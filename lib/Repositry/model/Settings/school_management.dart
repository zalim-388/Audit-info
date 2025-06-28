// To parse this JSON data, do
//
//     final schoolManagementModel = schoolManagementModelFromJson(jsonString);

import 'dart:convert';

List<SchoolManagementModel> schoolManagementModelFromJson(String str) => List<SchoolManagementModel>.from(json.decode(str).map((x) => SchoolManagementModel.fromJson(x)));

String schoolManagementModelToJson(List<SchoolManagementModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SchoolManagementModel {
    String id;
    String name;
    String schoolCode;
    BranchId branchId;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    SchoolManagementModel({
        required this.id,
        required this.name,
        required this.schoolCode,
        required this.branchId,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory SchoolManagementModel.fromJson(Map<String, dynamic> json) => SchoolManagementModel(
        id: json["_id"],
        name: json["name"],
        schoolCode: json["school_code"],
        branchId: BranchId.fromJson(json["branchId"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "school_code": schoolCode,
        "branchId": branchId.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class BranchId {
    String id;
    String name;
    String code;
    bool status;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    BranchId({
        required this.id,
        required this.name,
        required this.code,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory BranchId.fromJson(Map<String, dynamic> json) => BranchId(
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
