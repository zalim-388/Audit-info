// To parse this JSON data, do
//
//     final managermodel = managermodelFromJson(jsonString);

import 'dart:convert';

List<Managermodel> managermodelFromJson(String str) => List<Managermodel>.from(json.decode(str).map((x) => Managermodel.fromJson(x)));

String managermodelToJson(List<Managermodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Managermodel {
    String id;
    String name;
    String email;
    String password;
    String position;
    BranchId branchId;
    String employeeCode;
    int phoneNumber;
    DateTime dateOfJoining;
    String address;
    bool refresh;
    int pointAmount;
    int salary;
    int v;

    Managermodel({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.position,
        required this.branchId,
        required this.employeeCode,
        required this.phoneNumber,
        required this.dateOfJoining,
        required this.address,
        required this.refresh,
        required this.pointAmount,
        required this.salary,
        required this.v,
    });

    factory Managermodel.fromJson(Map<String, dynamic> json) => Managermodel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        position: json["position"],
        branchId: BranchId.fromJson(json["branchId"]),
        employeeCode: json["employee_code"],
        phoneNumber: json["phone_number"],
        dateOfJoining: DateTime.parse(json["date_of_joining"]),
        address: json["address"],
        refresh: json["refresh"],
        pointAmount: json["point_amount"],
        salary: json["salary"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "position": position,
        "branchId": branchId.toJson(),
        "employee_code": employeeCode,
        "phone_number": phoneNumber,
        "date_of_joining": dateOfJoining.toIso8601String(),
        "address": address,
        "refresh": refresh,
        "point_amount": pointAmount,
        "salary": salary,
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
