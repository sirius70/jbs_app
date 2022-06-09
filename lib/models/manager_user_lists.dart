// To parse this JSON data, do
//
//     final managerUserLists = managerUserListsFromJson(jsonString);

import 'dart:convert';

ManagerUserLists managerUserListsFromJson(String str) => ManagerUserLists.fromJson(json.decode(str));

String managerUserListsToJson(ManagerUserLists data) => json.encode(data.toJson());

class ManagerUserLists {
  ManagerUserLists({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  String status;
  bool success;
  String message;
  List<Datum> data;

  factory ManagerUserLists.fromJson(Map<String, dynamic> json) => ManagerUserLists(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.employeeId,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  int employeeId;
  String name;
  String email;
  String phoneNumber;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    employeeId: json["employee_id"],
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_Number"],
  );

  Map<String, dynamic> toJson() => {
    "employee_id": employeeId,
    "name": name,
    "email": email,
    "phone_Number": phoneNumber,
  };
}
