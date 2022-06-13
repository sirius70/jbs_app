// To parse this JSON data, do
//
//     final deletedEmployeesList = deletedEmployeesListFromJson(jsonString);

import 'dart:convert';

DeletedEmployeesList deletedEmployeesListFromJson(String str) => DeletedEmployeesList.fromJson(json.decode(str));

String deletedEmployeesListToJson(DeletedEmployeesList data) => json.encode(data.toJson());

class DeletedEmployeesList {
  DeletedEmployeesList({
    required this.status,
    required this.success,
    required this.message,
    required this.employees,
  });

  String status;
  bool success;
  String message;
  List<Employee> employees;

  factory DeletedEmployeesList.fromJson(Map<String, dynamic> json) => DeletedEmployeesList(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    employees: List<Employee>.from(json["employees"].map((x) => Employee.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
  };
}

class Employee {
  Employee({
    required this.email,
    required this.phoneNumber,
    required this.name,
  });

  String email;
  String phoneNumber;
  String name;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    email: json["email"],
    phoneNumber: json["phone_Number"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "phone_Number": phoneNumber,
    "name": name,
  };
}
