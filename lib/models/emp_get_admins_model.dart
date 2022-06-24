class GetAdmins {
  GetAdmins({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<Data1> data;

  GetAdmins.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data1.fromJson(e)).toList();
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

class Data1 {
  Data1({
    required this.name,
    required this.employeeId,
  });
  late final String name;
  late final int employeeId;

  Data1.fromJson(Map<String, dynamic> json){
    name = json['name'];
    employeeId = json['employee_Id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['employee_Id'] = employeeId;
    return _data;
  }
}