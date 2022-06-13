class GuestsInsideReport {
  String? status;
  bool? success;
  String? message;
  List<VisitorReportsToday>? visitorReportsToday;

  GuestsInsideReport(
      {this.status, this.success, this.message, this.visitorReportsToday});

  GuestsInsideReport.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    if (json['Visitor_Reports_Today'] != null) {
      visitorReportsToday = <VisitorReportsToday>[];
      json['Visitor_Reports_Today'].forEach((v) {
        visitorReportsToday!.add(new VisitorReportsToday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.visitorReportsToday != null) {
      data['Visitor_Reports_Today'] =
          this.visitorReportsToday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VisitorReportsToday {
  int? checkOut;
  String? checkOutTime;
  String? vISITORENTRYTIME;
  String? vISITORNAME;
  String? vISITOREmail;
  String? vISITORPHOTO;
  String? vISITORPHONENUMBER;
  String? vISITORCOMPANYNAME;
  int? nDASign;
  String? eMPLOYEENAME;
  String? eMPLOYEEEMAIL;
  String? eMPLOYEEPHONENUMBER;

  VisitorReportsToday(
      {this.checkOut,
        this.checkOutTime,
        this.vISITORENTRYTIME,
        this.vISITORNAME,
        this.vISITOREmail,
        this.vISITORPHOTO,
        this.vISITORPHONENUMBER,
        this.vISITORCOMPANYNAME,
        this.nDASign,
        this.eMPLOYEENAME,
        this.eMPLOYEEEMAIL,
        this.eMPLOYEEPHONENUMBER});

  VisitorReportsToday.fromJson(Map<String, dynamic> json) {
    checkOut = json['check_Out'];
    checkOutTime = json['check_Out_Time'];
    vISITORENTRYTIME = json['VISITOR_ENTRY_TIME'];
    vISITORNAME = json['VISITOR_NAME'];
    vISITOREmail = json['VISITOR_email'];
    vISITORPHOTO = json['VISITOR_PHOTO'];
    vISITORPHONENUMBER = json['VISITOR_PHONE_NUMBER'];
    vISITORCOMPANYNAME = json['VISITOR_COMPANY_NAME'];
    nDASign = json['NDA_sign'];
    eMPLOYEENAME = json['EMPLOYEE_NAME'];
    eMPLOYEEEMAIL = json['EMPLOYEE_EMAIL'];
    eMPLOYEEPHONENUMBER = json['EMPLOYEE_PHONE_NUMBER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['check_Out'] = this.checkOut;
    data['check_Out_Time'] = this.checkOutTime;
    data['VISITOR_ENTRY_TIME'] = this.vISITORENTRYTIME;
    data['VISITOR_NAME'] = this.vISITORNAME;
    data['VISITOR_email'] = this.vISITOREmail;
    data['VISITOR_PHOTO'] = this.vISITORPHOTO;
    data['VISITOR_PHONE_NUMBER'] = this.vISITORPHONENUMBER;
    data['VISITOR_COMPANY_NAME'] = this.vISITORCOMPANYNAME;
    data['NDA_sign'] = this.nDASign;
    data['EMPLOYEE_NAME'] = this.eMPLOYEENAME;
    data['EMPLOYEE_EMAIL'] = this.eMPLOYEEEMAIL;
    data['EMPLOYEE_PHONE_NUMBER'] = this.eMPLOYEEPHONENUMBER;
    return data;
  }
}
