// To parse this JSON data, do
//
//     final collegeManagementModel = collegeManagementModelFromJson(jsonString);

import 'dart:convert';

List<CollegeManagementModel> collegeManagementModelFromJson(String str) => List<CollegeManagementModel>.from(json.decode(str).map((x) => CollegeManagementModel.fromJson(x)));

String collegeManagementModelToJson(List<CollegeManagementModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CollegeManagementModel {
    String id;
    String college;
    String city;
    String state;
    String category;
    BranchId branchId;
    int bmPoint;
    int srcPoint;
    int sroPoint;
    bool status;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    CollegeManagementModel({
        required this.id,
        required this.college,
        required this.city,
        required this.state,
        required this.category,
        required this.branchId,
        required this.bmPoint,
        required this.srcPoint,
        required this.sroPoint,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory CollegeManagementModel.fromJson(Map<String, dynamic> json) => CollegeManagementModel(
        id: json["_id"],
        college: json["college"],
        city: json["city"],
        state: json["state"],
        category: json["category"],
        branchId: BranchId.fromJson(json["branchId"]),
        bmPoint: json["bm_point"],
        srcPoint: json["src_point"],
        sroPoint: json["sro_point"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "college": college,
        "city": city,
        "state": state,
        "category": category,
        "branchId": branchId.toJson(),
        "bm_point": bmPoint,
        "src_point": srcPoint,
        "sro_point": sroPoint,
        "status": status,
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
