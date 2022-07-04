class DisabledEmployeesList {
  DisabledEmployeesList({
    required this.status,
    required this.success,
    required this.message,
    required this.employees,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<Employees> employees;

  DisabledEmployeesList.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    employees = List.from(json['employees']).map((e)=>Employees.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['employees'] = employees.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Employees {
  Employees({
    required this.email,
    required this.phoneNumber,
    required this.employeeId,
    required this.name,
  });
  late final String email;
  late final String phoneNumber;
  late final int employeeId;
  late final String name;

  Employees.fromJson(Map<String, dynamic> json){
    email = json['email'];
    phoneNumber = json['phone_Number'];
    employeeId = json['employee_Id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['phone_Number'] = phoneNumber;
    _data['employee_Id'] = employeeId;
    _data['name'] = name;
    return _data;
  }
}