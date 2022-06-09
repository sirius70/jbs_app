// To parse this JSON data, do
//
//     final userListAttendanceApi = userListAttendanceApiFromJson(jsonString);

import 'dart:convert';

UserListAttendanceApi userListAttendanceApiFromJson(String str) => UserListAttendanceApi.fromJson(json.decode(str));

String userListAttendanceApiToJson(UserListAttendanceApi data) => json.encode(data.toJson());

class UserListAttendanceApi {
  UserListAttendanceApi({
    required this.status,
    required this.success,
    required this.message,
    required this.present,
    required this.absent,
  });

  String status;
  bool success;
  String message;
  List<Sent> present;
  List<Sent> absent;

  factory UserListAttendanceApi.fromJson(Map<String, dynamic> json) => UserListAttendanceApi(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    present: List<Sent>.from(json["present"].map((x) => Sent.fromJson(x))),
    absent: List<Sent>.from(json["absent"].map((x) => Sent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "present": List<dynamic>.from(present.map((x) => x.toJson())),
    "absent": List<dynamic>.from(absent.map((x) => x.toJson())),
  };
}

class Sent {
  Sent({
    required this.countMarked,
  });

  int countMarked;

  factory Sent.fromJson(Map<String, dynamic> json) => Sent(
    countMarked: json["COUNT(marked)"],
  );

  Map<String, dynamic> toJson() => {
    "COUNT(marked)": countMarked,
  };
}
