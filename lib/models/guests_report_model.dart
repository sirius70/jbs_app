class GuestsInsideReport  {
  GuestsInsideReport ({
    required this.status,
    required this.success,
    required this.message,
    required this.visitorReportsToday,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<VisitorReportsToday> visitorReportsToday;

  GuestsInsideReport .fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    visitorReportsToday = List.from(json['Visitor_Reports_Today']).map((e)=>VisitorReportsToday.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['Visitor_Reports_Today'] = visitorReportsToday.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class VisitorReportsToday {
  VisitorReportsToday({
    required this.checkOut,
    this.checkOutTime,
    required this.visitorEntryTime,
    required this.visitorName,
    required this.visitorEmail,
    this.visitorPhoto,
    required this.visitorPhoneNumber,
    required this.visitorCompanyName,
    required this.visitorNdaSign,
    required this.employeeName,
    required this.employeeEmail,
    required this.employeePhoneNumber,
  });
  late final int checkOut;
  late final String? checkOutTime;
  late final String visitorEntryTime;
  late final String visitorName;
  late final String visitorEmail;
  late final String? visitorPhoto;
  late final String visitorPhoneNumber;
  late final String visitorCompanyName;
  late final int visitorNdaSign;
  late final String employeeName;
  late final String employeeEmail;
  late final String employeePhoneNumber;

  VisitorReportsToday.fromJson(Map<String, dynamic> json){
    checkOut = json['check_Out'];
    checkOutTime = null;
    visitorEntryTime = json['visitor_Entry_Time'];
    visitorName = json['visitor_Name'];
    visitorEmail = json['visitor_Email'];
    visitorPhoto = null;
    visitorPhoneNumber = json['visitor_Phone_Number'];
    visitorCompanyName = json['visitor_Company_Name'];
    visitorNdaSign = json['visitor_nda_Sign'];
    employeeName = json['employee_Name'];
    employeeEmail = json['employee_Email'];
    employeePhoneNumber = json['employee_Phone_Number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['check_Out'] = checkOut;
    _data['check_Out_Time'] = checkOutTime;
    _data['visitor_Entry_Time'] = visitorEntryTime;
    _data['visitor_Name'] = visitorName;
    _data['visitor_Email'] = visitorEmail;
    _data['visitor_Photo'] = visitorPhoto;
    _data['visitor_Phone_Number'] = visitorPhoneNumber;
    _data['visitor_Company_Name'] = visitorCompanyName;
    _data['visitor_nda_Sign'] = visitorNdaSign;
    _data['employee_Name'] = employeeName;
    _data['employee_Email'] = employeeEmail;
    _data['employee_Phone_Number'] = employeePhoneNumber;
    return _data;
  }
}