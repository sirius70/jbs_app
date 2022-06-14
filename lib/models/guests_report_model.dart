import 'dart:convert';

GuestsInsideReport guestsInsideReportFromJson(String str) => GuestsInsideReport.fromJson(json.decode(str));

String guestsInsideReportToJson(GuestsInsideReport data) => json.encode(data.toJson());

class GuestsInsideReport {
  String status;
  bool success;
  String message;
  List<VisitorReportsToday> visitorReportsToday;

  GuestsInsideReport(
      {required this.status,
        required this.success,
        required this.message,
        required this.visitorReportsToday});

  factory GuestsInsideReport.fromJson(Map<String, dynamic> json) => GuestsInsideReport(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    visitorReportsToday: List<VisitorReportsToday>.from(json["employees"].map((x) => VisitorReportsToday.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "deliveryReportsToday": List<dynamic>.from(visitorReportsToday.map((x) => x.toJson())),
  };
}

class VisitorReportsToday {
  int checkOut;
  String checkOutTime;
  String vISITORENTRYTIME;
  String vISITORNAME;
  String vISITOREmail;
  String vISITORPHOTO;
  String vISITORPHONENUMBER;
  String vISITORCOMPANYNAME;
  int nDASign;
  String eMPLOYEENAME;
  String eMPLOYEEEMAIL;
  String eMPLOYEEPHONENUMBER;

  VisitorReportsToday(
      {required this.checkOut,
        required this.checkOutTime,
        required this.vISITORENTRYTIME,
        required this.vISITORNAME,
        required this.vISITOREmail,
        required this.vISITORPHOTO,
        required this.vISITORPHONENUMBER,
        required this.vISITORCOMPANYNAME,
        required this.nDASign,
        required this.eMPLOYEENAME,
        required this.eMPLOYEEEMAIL,
        required this.eMPLOYEEPHONENUMBER});


 factory VisitorReportsToday.fromJson(Map<String, dynamic> json) => VisitorReportsToday(
    checkOut : json['check_Out'],
    checkOutTime : json['check_Out_Time'],
    vISITORENTRYTIME : json['VISITOR_ENTRY_TIME'],
    vISITORNAME : json['VISITOR_NAME'],
    vISITOREmail : json['VISITOR_email'],
    vISITORPHOTO : json['VISITOR_PHOTO'],
    vISITORPHONENUMBER : json['VISITOR_PHONE_NUMBER'],
    vISITORCOMPANYNAME : json['VISITOR_COMPANY_NAME'],
    nDASign : json['NDA_sign'],
    eMPLOYEENAME : json['EMPLOYEE_NAME'],
    eMPLOYEEEMAIL : json['EMPLOYEE_EMAIL'],
    eMPLOYEEPHONENUMBER : json['EMPLOYEE_PHONE_NUMBER'],
  );

  Map<String, dynamic> toJson() =>{
    'check_Out': checkOut,
    'check_Out_Time': checkOutTime,
    'VISITOR_ENTRY_TIME': vISITORENTRYTIME,
    'VISITOR_NAME': vISITORNAME,
    'VISITOR_email': vISITOREmail,
    'VISITOR_PHOTO': vISITORPHOTO,
    'VISITOR_PHONE_NUMBER': vISITORPHONENUMBER,
    'VISITOR_COMPANY_NAME': vISITORCOMPANYNAME,
    'NDA_sign': nDASign,
    'EMPLOYEE_NAME': eMPLOYEENAME,
    'EMPLOYEE_EMAIL': eMPLOYEEEMAIL,
    'EMPLOYEE_PHONE_NUMBER': eMPLOYEEPHONENUMBER,
  };
}
