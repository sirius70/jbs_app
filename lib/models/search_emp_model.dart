class SearchEmpRes {
  SearchEmpRes({
    required this.status,
    required this.success,
    required this.message,
    required this.employee,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<Employee> employee;

  SearchEmpRes.fromJson(Map<String, dynamic> json){
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
    required this.name,
    this.baseUrl,
  });
  late final int employeeId;
  late final String name;
  late final Null baseUrl;

  Employee.fromJson(Map<String, dynamic> json){
    employeeId = json['employee_Id'];
    name = json['name'];
    baseUrl = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['employee_Id'] = employeeId;
    _data['name'] = name;
    _data['base_Url'] = baseUrl;
    return _data;
  }
}