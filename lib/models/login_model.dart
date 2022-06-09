class LoginApi {
  LoginApi({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
    required this.tokens,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final Data data;
  late final Tokens tokens;

  LoginApi.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    data = Data.fromJson(json['data']);
    tokens = Tokens.fromJson(json['tokens']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.toJson();
    _data['tokens'] = tokens.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.isAdmin,
    required this.isManager,
    required this.isSuperUser,
    this.baseUrl,
    required this.orgId,
    required this.next,
    required this.employeeId,
    required this.companyName,
    required this.companyLogo,
    required this.locations,
    required this.test,
  });
  late final int isAdmin;
  late final int isManager;
  late final int isSuperUser;
  late final Null baseUrl;
  late final int orgId;
  late final int next;
  late final int employeeId;
  late final String companyName;
  late final String companyLogo;
  late final List<Locations> locations;
  late final String test;

  Data.fromJson(Map<String, dynamic> json){
    isAdmin = json['is_Admin'];
    isManager = json['is_Manager'];
    isSuperUser = json['is_Super_User'];
    baseUrl = null;
    orgId = json['org_Id'];
    next = json['next'];
    employeeId = json['employee_Id'];
    companyName = json['company_Name'];
    companyLogo = json['company_Logo'];
    locations = List.from(json['locations']).map((e)=>Locations.fromJson(e)).toList();
    test = json['test'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['is_Admin'] = isAdmin;
    _data['is_Manager'] = isManager;
    _data['is_Super_User'] = isSuperUser;
    _data['base_Url'] = baseUrl;
    _data['org_Id'] = orgId;
    _data['next'] = next;
    _data['employee_Id'] = employeeId;
    _data['company_Name'] = companyName;
    _data['company_Logo'] = companyLogo;
    _data['locations'] = locations.map((e)=>e.toJson()).toList();
    _data['test'] = test;
    return _data;
  }
}

class Locations {
  Locations({
    required this.locationId,
    required this.name,
    required this.radius,
    required this.longitude,
    required this.latitude,
  });
  late final int locationId;
  late final String name;
  late final String radius;
  late final String longitude;
  late final String latitude;

  Locations.fromJson(Map<String, dynamic> json){
    locationId = json['location_Id'];
    name = json['name'];
    radius = json['radius'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['location_Id'] = locationId;
    _data['name'] = name;
    _data['radius'] = radius;
    _data['longitude'] = longitude;
    _data['latitude'] = latitude;
    return _data;
  }
}

class Tokens {
  Tokens({
    required this.accessToken,
    required this.refreshToken,
  });
  late final String accessToken;
  late final String refreshToken;

  Tokens.fromJson(Map<String, dynamic> json){
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accessToken'] = accessToken;
    _data['refreshToken'] = refreshToken;
    return _data;
  }
}