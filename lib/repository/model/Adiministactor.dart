// To parse this JSON data, do
//
//     final adiministactormodel = adiministactormodelFromJson(jsonString);

import 'dart:convert';

List<Adiministactormodel> adiministactormodelFromJson(String str) => List<Adiministactormodel>.from(json.decode(str).map((x) => Adiministactormodel.fromJson(x)));

String adiministactormodelToJson(List<Adiministactormodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Adiministactormodel {
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
  bool isAdmin;
  bool headAdministractor;
  BranchId? branchId; // made nullable
  List<dynamic> managerPoint;
  List<dynamic> lead;
  List<dynamic> registration;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Adiministactormodel({
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

  factory Adiministactormodel.fromJson(Map<String, dynamic> json) {
    return Adiministactormodel(
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
      isAdmin: json["is_admin"],
      headAdministractor: json["head_administractor"],
      branchId: json["branchId"] != null ? BranchId.fromJson(json["branchId"]) : null,
      managerPoint: List<dynamic>.from(json["managerPoint"].map((x) => x)),
      lead: List<dynamic>.from(json["lead"].map((x) => x)),
      registration: List<dynamic>.from(json["registration"].map((x) => x)),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      v: json["__v"],
    );
  }

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
        "is_admin": isAdmin,
        "head_administractor": headAdministractor,
        "branchId": branchId?.toJson(), // safely serialize if not null
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
