class UserListApi {
  UserListApi({
    required this.status,
    required this.success,
    required this.message,
    required this.employee,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<Employee> employee;

  UserListApi.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    employee = List.from(json['employee']).map((e)=>Employee.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['employee'] = employee.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Employee {
  Employee({
    required this.employeeId,
    required this.orgId,
    required this.email,
    required this.phoneNumber,
    required this.name,
  });
  late final int employeeId;
  late final int orgId;
  late final String email;
  late final String phoneNumber;
  late final String name;

  Employee.fromJson(Map<String, dynamic> json){
    employeeId = json['employee_Id'];
    orgId = json['org_Id'];
    email = json['email'];
    phoneNumber = json['phone_Number'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['employee_Id'] = employeeId;
    _data['org_Id'] = orgId;
    _data['email'] = email;
    _data['phone_Number'] = phoneNumber;
    _data['name'] = name;
    return _data;
  }
}