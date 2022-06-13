// To parse this JSON data, do
//
//     final profileApi = profileApiFromJson(jsonString);

import 'dart:convert';

ProfileApi profileApiFromJson(String str) => ProfileApi.fromJson(json.decode(str));

String profileApiToJson(ProfileApi data) => json.encode(data.toJson());

class ProfileApi {
  ProfileApi({
    required this.status,
    required this.message,
    required this.success,
    required this.data,
  });

  String status;
  String message;
  bool success;
  Data data;

  factory ProfileApi.fromJson(Map<String, dynamic> json) => ProfileApi(
    status: json["status"],
    message: json["message"],
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.baseUrl,
  });

  String name;
  String email;
  String phoneNumber;
  dynamic baseUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_Number"],
    baseUrl: json["base_Url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone_Number": phoneNumber,
    "base_Url": baseUrl,
  };
}
