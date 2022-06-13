class DeleteEmpRes {
  DeleteEmpRes({
    required this.status,
    required this.success,
    required this.message,
    required this.EmployeeId,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final String EmployeeId;

  DeleteEmpRes.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    EmployeeId = json['EmployeeId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['EmployeeId'] = EmployeeId;
    return _data;
  }
}