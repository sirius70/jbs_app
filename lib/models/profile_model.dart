class ProfileApi {
  ProfileApi({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<Data> data;

  ProfileApi.fromJson(Map<String, dynamic> json){
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
    required this.address,
  });
  late final String name;
  late final String email;
  late final String phoneNumber;
  late final String address;

  Data.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_Number'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['phone_Number'] = phoneNumber;
    _data['address'] = address;
    return _data;
  }
}