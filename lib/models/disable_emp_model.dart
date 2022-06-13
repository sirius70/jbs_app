class DisableEmpRes {
  DisableEmpRes({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final String data;

  DisableEmpRes.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data;
    return _data;
  }
}