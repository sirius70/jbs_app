// class AdminEmpList {
//   AdminEmpList({
//     required this.status,
//     required this.success,
//     required this.message,
//     required this.employee,
//   });
//   late final String status;
//   late final bool success;
//   late final String message;
//   late final List<Employee> employee;
//
//   AdminEmpList.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     success = json['success'];
//     message = json['message'];
//     employee = List.from(json['employee']).map((e)=>Employee.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['success'] = success;
//     _data['message'] = message;
//     _data['employee'] = employee.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Employee {
//   Employee({
//     required this.employeeId,
//     required this.orgId,
//     required this.email,
//     required this.phoneNumber,
//     required this.name,
//   });
//   late final int employeeId;
//   late final int orgId;
//   late final String email;
//   late final String phoneNumber;
//   late final String name;
//
//   Employee.fromJson(Map<String, dynamic> json){
//     employeeId = json['employee_Id'];
//     orgId = json['org_Id'];
//     email = json['email'];
//     phoneNumber = json['phone_Number'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['employee_Id'] = employeeId;
//     _data['org_Id'] = orgId;
//     _data['email'] = email;
//     _data['phone_Number'] = phoneNumber;
//     _data['name'] = name;
//     return _data;
//   }
// }




// To parse this JSON data, do
//
//     final userListApi = userListApiFromJson(jsonString);

import 'dart:convert';

UserListApi userListApiFromJson(String str) => UserListApi.fromJson(json.decode(str));

String userListApiToJson(UserListApi data) => json.encode(data.toJson());

class UserListApi {
  UserListApi({
    required this.status,
    required this.success,
    required this.message,
    required this.employee,
  });

  String status;
  bool success;
  String message;
  List<Employee> employee;

  factory UserListApi.fromJson(Map<String, dynamic> json) => UserListApi(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    employee: List<Employee>.from(json["employee"].map((x) => Employee.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "employee": List<dynamic>.from(employee.map((x) => x.toJson())),
  };
}

class Employee {
  Employee({
    required this.employeeId,
    required this.orgId,
    required this.email,
    required this.phoneNumber,
    required this.name,
  });

  int employeeId;
  int orgId;
  String email;
  String phoneNumber;
  String name;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    employeeId: json["employee_Id"],
    orgId: json["org_Id"],
    email: json["email"],
    phoneNumber: json["phone_Number"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "employee_Id": employeeId,
    "org_Id": orgId,
    "email": email,
    "phone_Number": phoneNumber,
    "name": name,
  };
}
