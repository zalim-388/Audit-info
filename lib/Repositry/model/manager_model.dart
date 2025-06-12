// To parse this JSON data, do
//
//     final managermodel = managermodelFromJson(jsonString);

import 'dart:convert';

List<Managermodel> managermodelFromJson(String str) => List<Managermodel>.from(
  json.decode(str).map((x) => Managermodel.fromJson(x)),
);

String managermodelToJson(List<Managermodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Managermodel {
  String id;
  String name;
  String email;
  String password;
  String position;
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
