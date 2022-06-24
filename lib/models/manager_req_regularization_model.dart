class ManagerRequestRegularization {
  ManagerRequestRegularization({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<Data> data;

  ManagerRequestRegularization.fromJson(Map<String, dynamic> json){
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
    required this.id,
    required this.employeeId,
    required this.controllerId,
    required this.reason,
    required this.approvalStatus,
    required this.reqType,
    required this.dateOfReq,
    required this.dateFor,
    required this.AttendanceId,
  });
  late final int id;
  late final int employeeId;
  late final int controllerId;
  late final String reason;
  late final int approvalStatus;
  late final String reqType;
  late final String dateOfReq;
  late final String dateFor;
  late final int AttendanceId;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    employeeId = json['employee_id'];
    controllerId = json['controller_id'];
    reason = json['reason'];
    approvalStatus = json['approval_status'];
    reqType = json['req_type'];
    dateOfReq = json['date_of_req'];
    dateFor = json['date_for'];
    AttendanceId = json['Attendance_Id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['employee_id'] = employeeId;
    _data['controller_id'] = controllerId;
    _data['reason'] = reason;
    _data['approval_status'] = approvalStatus;
    _data['req_type'] = reqType;
    _data['date_of_req'] = dateOfReq;
    _data['date_for'] = dateFor;
    _data['Attendance_Id'] = AttendanceId;
    return _data;
  }
}