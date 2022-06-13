// To parse this JSON data, do
//
//     final disabledEmployeesList = disabledEmployeesListFromJson(jsonString);

import 'dart:convert';

DisabledEmployeesList disabledEmployeesListFromJson(String str) => DisabledEmployeesList.fromJson(json.decode(str));

String disabledEmployeesListToJson(DisabledEmployeesList data) => json.encode(data.toJson());

class DisabledEmployeesList {
  DisabledEmployeesList({
    required this.status,
    required this.success,
    required this.message,
    required this.employees,
  });

  String status;
  bool success;
  String message;
  List<Employee> employees;

  factory DisabledEmployeesList.fromJson(Map<String, dynamic> json) => DisabledEmployeesList(
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
    required this.employeeId,
    required this.name,
  });

  String email;
  String phoneNumber;
  int employeeId;
  String name;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    email: json["email"],
    phoneNumber: json["phone_Number"],
    employeeId: json["employee_Id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "phone_Number": phoneNumber,
    "employee_Id": employeeId,
    "name": name,
  };
}
