// To parse this JSON data, do
//
//     final accountantModel = accountantModelFromJson(jsonString);

import 'dart:convert';

List<AccountantModel> accountantModelFromJson(String str) => List<AccountantModel>.from(json.decode(str).map((x) => AccountantModel.fromJson(x)));

String accountantModelToJson(List<AccountantModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AccountantModel {
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
    List<dynamic> managerPoint;
    List<dynamic> lead;
    List<dynamic> registration;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    AccountantModel({
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
        required this.managerPoint,
        required this.lead,
        required this.registration,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory AccountantModel.fromJson(Map<String, dynamic> json) => AccountantModel(
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
        "is_admin": isAdmin,
        "head_administractor": headAdministractor,
        "managerPoint": List<dynamic>.from(managerPoint.map((x) => x)),
        "lead": List<dynamic>.from(lead.map((x) => x)),
        "registration": List<dynamic>.from(registration.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
