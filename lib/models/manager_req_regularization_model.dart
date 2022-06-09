// To parse this JSON data, do
//
//     final managerRequestRegularization = managerRequestRegularizationFromJson(jsonString);

import 'dart:convert';

ManagerRequestRegularization managerRequestRegularizationFromJson(String str) => ManagerRequestRegularization.fromJson(json.decode(str));

String managerRequestRegularizationToJson(ManagerRequestRegularization data) => json.encode(data.toJson());

class ManagerRequestRegularization {
  ManagerRequestRegularization({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  String status;
  bool success;
  String message;
  List<Datum> data;

  factory ManagerRequestRegularization.fromJson(Map<String, dynamic> json) => ManagerRequestRegularization(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.employeeId,
    required this.controllerId,
    required this.reason,
    required this.approvalStatus,
    required this.reqType,
    required this.dateOfReq,
    required this.dateFor,
  });

  int id;
  int employeeId;
  int controllerId;
  String reason;
  int approvalStatus;
  String reqType;
  DateTime dateOfReq;
  String dateFor;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    employeeId: json["employee_id"],
    controllerId: json["controller_id"],
    reason: json["reason"],
    approvalStatus: json["approval_status"],
    reqType: json["req_type"],
    dateOfReq: DateTime.parse(json["date_of_req"]),
    dateFor: json["date_for"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_id": employeeId,
    "controller_id": controllerId,
    "reason": reason,
    "approval_status": approvalStatus,
    "req_type": reqType,
    "date_of_req": dateOfReq.toIso8601String(),
    "date_for": dateFor,
  };
}
