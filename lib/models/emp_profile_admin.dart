class GetEmpProfileAdmin {
  GetEmpProfileAdmin({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<Data> data;

  GetEmpProfileAdmin.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.isManager,
    required this.address,
    required this.employeeId,
    required this.baseUrl,
    required this.department,
  });
  late final String name;
  late final String email;
  late final String phoneNumber;
  late final int isManager;
  late final String address;
  late final int employeeId;
  late final String baseUrl;
  late final String department;

  Data.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_Number'];
    isManager = json['is_Manager'];
    address = json['address'];
    employeeId = json['employee_Id'];
    baseUrl = json['base_Url'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['phone_Number'] = phoneNumber;
    _data['is_Manager'] = isManager;
    _data['address'] = address;
    _data['employee_Id'] = employeeId;
    _data['base_Url'] = baseUrl;
    _data['department'] = department;
    return _data;
  }
}