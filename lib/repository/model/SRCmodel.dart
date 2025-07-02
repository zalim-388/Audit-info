// To parse this JSON data, do
//
//     final srcModel = srcModelFromJson(jsonString);

import 'dart:convert';

List<SrcModel> srcModelFromJson(String str) => List<SrcModel>.from(json.decode(str).map((x) => SrcModel.fromJson(x)));

String srcModelToJson(List<SrcModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SrcModel {
    String id;
    String name;
    String email;
    String password;
    String position;
    String employeeCode;
    String phoneNumber;
    DateTime dateOfJoining;
    String address;
    bool status;
    int pointAmount;
    bool isAdmin;
    bool headAdministractor;
    BranchId? branchId;
    List<dynamic> managerPoint;
    List<dynamic> lead;
    List<dynamic> registration;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    SrcModel({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.position,
        required this.employeeCode,
        required this.phoneNumber,
        required this.dateOfJoining,
        required this.address,
        required this.status,
        required this.pointAmount,
        required this.isAdmin,
        required this.headAdministractor,
        required this.branchId,
        required this.managerPoint,
        required this.lead,
        required this.registration,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory SrcModel.fromJson(Map<String, dynamic> json) => SrcModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        position: json["position"],
        employeeCode: json["employee_code"],
        phoneNumber: json["phone_number"],
        dateOfJoining: DateTime.parse(json["date_of_joining"]),
        address: json["address"],
        status: json["status"],
        pointAmount: json["point_amount"],
        isAdmin: json["is_admin"],
        headAdministractor: json["head_administractor"],
        branchId: json["branchId"] == null ? null : BranchId.fromJson(json["branchId"]),
        managerPoint: List<dynamic>.from(json["managerPoint"].map((x) => x)),
        lead: List<dynamic>.from(json["lead"].map((x) => x)),
        registration: List<dynamic>.from(json["registration"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "position": position,
        "employee_code": employeeCode,
        "phone_number": phoneNumber,
        "date_of_joining": dateOfJoining.toIso8601String(),
        "address": address,
        "status": status,
        "point_amount": pointAmount,
        "is_admin": isAdmin,
        "head_administractor": headAdministractor,
        "branchId": branchId?.toJson(),
        "managerPoint": List<dynamic>.from(managerPoint.map((x) => x)),
        "lead": List<dynamic>.from(lead.map((x) => x)),
        "registration": List<dynamic>.from(registration.map((x) => x)),
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
