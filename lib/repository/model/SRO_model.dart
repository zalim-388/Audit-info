// To parse this JSON data, do
//
//     final sroModel = sroModelFromJson(jsonString);

import 'dart:convert';

List<SroModel> sroModelFromJson(String str) =>
    List<SroModel>.from(json.decode(str).map((x) => SroModel.fromJson(x)));

String sroModelToJson(List<SroModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SroModel {
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
  BranchId? branchId; // Make branchId nullable
  List<dynamic> managerPoint;
  String srcId;
  List<dynamic> lead;
  List<dynamic> registration;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  SroModel({
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
    this.branchId, // Nullable, so no 'required'
    required this.managerPoint,
    required this.srcId,
    required this.lead,
    required this.registration,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory SroModel.fromJson(Map<String, dynamic> json) => SroModel(
        id: json["_id"] ?? "", // Provide default value if null
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        password: json["password"] ?? "",
        position: json["position"] ?? "",
        employeeCode: json["employee_code"] ?? "",
        phoneNumber: json["phone_number"] ?? "",
        dateOfJoining: json["date_of_joining"] != null
            ? DateTime.parse(json["date_of_joining"])
            : DateTime.now(), // Default to now if null
        address: json["address"] ?? "",
        status: json["status"] ?? false,
        pointAmount: json["point_amount"] ?? 0,
        isAdmin: json["is_admin"] ?? false,
        headAdministractor: json["head_administractor"] ?? false,
        branchId: json["branchId"] != null
            ? BranchId.fromJson(json["branchId"])
            : null, // Handle null branchId
        managerPoint: json["managerPoint"] != null
            ? List<dynamic>.from(json["managerPoint"].map((x) => x))
            : [], // Default to empty list
        srcId: json["srcId"] ?? "",
        lead: json["lead"] != null
            ? List<dynamic>.from(json["lead"].map((x) => x))
            : [], // Default to empty list
        registration: json["registration"] != null
            ? List<dynamic>.from(json["registration"].map((x) => x))
            : [], // Default to empty list
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
        v: json["__v"] ?? 0,
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
        "branchId": branchId?.toJson(), // Handle nullable branchId
        "managerPoint": List<dynamic>.from(managerPoint.map((x) => x)),
        "srcId": srcId,
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
