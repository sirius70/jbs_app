// To parse this JSON data, do
//
//     final managerUserDetailsLists = managerUserDetailsListsFromJson(jsonString);

import 'dart:convert';

ManagerUserDetailsLists managerUserDetailsListsFromJson(String str) => ManagerUserDetailsLists.fromJson(json.decode(str));

String managerUserDetailsListsToJson(ManagerUserDetailsLists data) => json.encode(data.toJson());

class ManagerUserDetailsLists {
  ManagerUserDetailsLists({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  String status;
  bool success;
  String message;
  List<Datum> data;

  factory ManagerUserDetailsLists.fromJson(Map<String, dynamic> json) => ManagerUserDetailsLists(
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
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  String name;
  String email;
  String phoneNumber;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_Number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone_Number": phoneNumber,
  };
}
