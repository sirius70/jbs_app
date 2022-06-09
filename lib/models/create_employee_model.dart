class CreateEmpRes {
  CreateEmpRes({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final Data data;

  CreateEmpRes.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.employeeId,
    required this.Email,
    required this.password,
  });
  late final int employeeId;
  late final String Email;
  late final String password;

  Data.fromJson(Map<String, dynamic> json){
    employeeId = json['employeeId'];
    Email = json['Email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['employeeId'] = employeeId;
    _data['Email'] = Email;
    _data['password'] = password;
    return _data;
  }
}

