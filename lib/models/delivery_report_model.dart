import 'dart:convert';

DeliveryInsideReport deliveryInsideReportFromJson(String str) => DeliveryInsideReport.fromJson(json.decode(str));

String DeliveryInsideReportToJson(DeliveryInsideReport data) => json.encode(data.toJson());

class DeliveryInsideReport {
  String status;
  bool success;
  String message;
  List<DeliveryReportsToday> deliveryReportsToday;

  DeliveryInsideReport(
      {required this.status,
        required this.success,
        required this.message,
        required this.deliveryReportsToday});
  factory DeliveryInsideReport.fromJson(Map<String, dynamic> json) => DeliveryInsideReport(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    deliveryReportsToday: List<DeliveryReportsToday>.from(json["employees"].map((x) => DeliveryReportsToday.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "deliveryReportsToday": List<dynamic>.from(deliveryReportsToday.map((x) => x.toJson())),
  };

}

class DeliveryReportsToday {
  int checkOut;
  String checkOutTime;
  String dELIVERYENTRYTIME;
  String dELIVERYNAME;
  String dELIVERYEMAIL;
  Null dELIVERYBOYPHOTO;
  int nDASign;
  String dELIVERYPHONENUMBER;
  String dELIVERYCOMPANYNAME;
  String eMPLOYEENAME;
  String eMPLOYEEEMAIL;
  String eMPLOYEEPHONENUMBER;

  DeliveryReportsToday(
      {required this.checkOut,
        required this.checkOutTime,
        required this.dELIVERYENTRYTIME,
        required this.dELIVERYNAME,
        required this.dELIVERYEMAIL,
        required this.dELIVERYBOYPHOTO,
        required this.nDASign,
        required this.dELIVERYPHONENUMBER,
        required this.dELIVERYCOMPANYNAME,
        required this.eMPLOYEENAME,
        required this.eMPLOYEEEMAIL,
        required this.eMPLOYEEPHONENUMBER});

  factory DeliveryReportsToday.fromJson(Map<String, dynamic> json) => DeliveryReportsToday(
      checkOut : json['check_Out'],
      checkOutTime : json['check_Out_Time'],
      dELIVERYENTRYTIME : json['DELIVERY_ENTRY_TIME'],
      dELIVERYNAME : json['DELIVERY_NAME'],
      dELIVERYEMAIL : json['DELIVERY_EMAIL'],
      dELIVERYBOYPHOTO : json['DELIVERY_BOY_PHOTO'],
      nDASign : json['NDA_sign'],
      dELIVERYPHONENUMBER : json['DELIVERY_PHONE_NUMBER'],
      dELIVERYCOMPANYNAME : json['DELIVERY_COMPANY_NAME'],
      eMPLOYEENAME : json['EMPLOYEE_NAME'],
      eMPLOYEEEMAIL : json['EMPLOYEE_EMAIL'],
      eMPLOYEEPHONENUMBER : json['EMPLOYEE_PHONE_NUMBER']
  );

  Map<String, dynamic> toJson() =>{
    'check_Out' : checkOut,
    'check_Out_Time': checkOutTime,
    'DELIVERY_ENTRY_TIME': dELIVERYENTRYTIME,
    'DELIVERY_NAME': dELIVERYNAME,
    'DELIVERY_EMAIL' : dELIVERYEMAIL,
    'DELIVERY_BOY_PHOTO': dELIVERYBOYPHOTO,
    'NDA_sign': nDASign,
    'DELIVERY_PHONE_NUMBER': dELIVERYPHONENUMBER,
    'DELIVERY_COMPANY_NAME': dELIVERYCOMPANYNAME,
    'EMPLOYEE_NAME': eMPLOYEENAME,
    'EMPLOYEE_EMAIL': eMPLOYEEEMAIL,
    'EMPLOYEE_PHONE_NUMBER': eMPLOYEEPHONENUMBER,
  };

}
