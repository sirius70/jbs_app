class GuestsInsideReport {
  GuestsInsideReport({
    required this.status,
    required this.success,
    required this.message,
    required this.visitorReportsToday,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<VisitorReportsToday> visitorReportsToday;

  GuestsInsideReport.fromJson(Map<String, dynamic> json){
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
    required this.VISITORENTRYTIME,
    required this.VISITORNAME,
    required this.VISITOREmail,
    required this.VISITORPHOTO,
    required this.VISITORPHONENUMBER,
    required this.VISITORCOMPANYNAME,
    required this.NDASign,
    required this.EMPLOYEENAME,
    required this.EMPLOYEEEMAIL,
    required this.EMPLOYEEPHONENUMBER,
  });
  late final int checkOut;
  late final String? checkOutTime;
  late final String VISITORENTRYTIME;
  late final String VISITORNAME;
  late final String VISITOREmail;
  late final String VISITORPHOTO;
  late final String VISITORPHONENUMBER;
  late final String VISITORCOMPANYNAME;
  late final int NDASign;
  late final String EMPLOYEENAME;
  late final String EMPLOYEEEMAIL;
  late final String EMPLOYEEPHONENUMBER;

  VisitorReportsToday.fromJson(Map<String, dynamic> json){
    checkOut = json['check_Out'];
    checkOutTime = null;
    VISITORENTRYTIME = json['VISITOR_ENTRY_TIME'];
    VISITORNAME = json['VISITOR_NAME'];
    VISITOREmail = json['VISITOR_email'];
    VISITORPHOTO = json['VISITOR_PHOTO'];
    VISITORPHONENUMBER = json['VISITOR_PHONE_NUMBER'];
    VISITORCOMPANYNAME = json['VISITOR_COMPANY_NAME'];
    NDASign = json['NDA_sign'];
    EMPLOYEENAME = json['EMPLOYEE_NAME'];
    EMPLOYEEEMAIL = json['EMPLOYEE_EMAIL'];
    EMPLOYEEPHONENUMBER = json['EMPLOYEE_PHONE_NUMBER'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['check_Out'] = checkOut;
    _data['check_Out_Time'] = checkOutTime;
    _data['VISITOR_ENTRY_TIME'] = VISITORENTRYTIME;
    _data['VISITOR_NAME'] = VISITORNAME;
    _data['VISITOR_email'] = VISITOREmail;
    _data['VISITOR_PHOTO'] = VISITORPHOTO;
    _data['VISITOR_PHONE_NUMBER'] = VISITORPHONENUMBER;
    _data['VISITOR_COMPANY_NAME'] = VISITORCOMPANYNAME;
    _data['NDA_sign'] = NDASign;
    _data['EMPLOYEE_NAME'] = EMPLOYEENAME;
    _data['EMPLOYEE_EMAIL'] = EMPLOYEEEMAIL;
    _data['EMPLOYEE_PHONE_NUMBER'] = EMPLOYEEPHONENUMBER;
    return _data;
  }
}