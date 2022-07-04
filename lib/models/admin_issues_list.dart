class AdminIssuesList {
  AdminIssuesList({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<Data> data;

  AdminIssuesList.fromJson(Map<String, dynamic> json){
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
    required this.issueLevel,
    required this.id,
    required this.EMPLOYEEID,
    required this.issueElaboration,
    required this.name,
    required this.email,
    this.baseUrl,
    required this.phoneNumber,
  });
  late final int issueLevel;
  late final int id;
  late final int EMPLOYEEID;
  late final String issueElaboration;
  late final String name;
  late final String email;
  late final Null baseUrl;
  late final String phoneNumber;

  Data.fromJson(Map<String, dynamic> json){
    issueLevel = json['issue_Level'];
    id = json['id'];
    EMPLOYEEID = json['EMPLOYEE_ID'];
    issueElaboration = json['issue_Elaboration'];
    name = json['name'];
    email = json['email'];
    baseUrl = null;
    phoneNumber = json['phone_Number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['issue_Level'] = issueLevel;
    _data['id'] = id;
    _data['EMPLOYEE_ID'] = EMPLOYEEID;
    _data['issue_Elaboration'] = issueElaboration;
    _data['name'] = name;
    _data['email'] = email;
    _data['base_Url'] = baseUrl;
    _data['phone_Number'] = phoneNumber;
    return _data;
  }
}