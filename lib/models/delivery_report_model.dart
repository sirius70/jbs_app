class DeliveryInsideReport {
  String? status;
  bool? success;
  String? message;
  List<DeliveryReportsToday>? deliveryReportsToday;

  DeliveryInsideReport(
      {this.status, this.success, this.message, this.deliveryReportsToday});

  DeliveryInsideReport.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    if (json['Delivery_Reports_Today'] != null) {
      deliveryReportsToday = <DeliveryReportsToday>[];
      json['Delivery_Reports_Today'].forEach((v) {
        deliveryReportsToday!.add(new DeliveryReportsToday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.deliveryReportsToday != null) {
      data['Delivery_Reports_Today'] =
          this.deliveryReportsToday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryReportsToday {
  int? checkOut;
  String? checkOutTime;
  String? dELIVERYENTRYTIME;
  String? dELIVERYNAME;
  String? dELIVERYEMAIL;
  Null? dELIVERYBOYPHOTO;
  int? nDASign;
  String? dELIVERYPHONENUMBER;
  String? dELIVERYCOMPANYNAME;
  String? eMPLOYEENAME;
  String? eMPLOYEEEMAIL;
  String? eMPLOYEEPHONENUMBER;

  DeliveryReportsToday(
      {this.checkOut,
        this.checkOutTime,
        this.dELIVERYENTRYTIME,
        this.dELIVERYNAME,
        this.dELIVERYEMAIL,
        this.dELIVERYBOYPHOTO,
        this.nDASign,
        this.dELIVERYPHONENUMBER,
        this.dELIVERYCOMPANYNAME,
        this.eMPLOYEENAME,
        this.eMPLOYEEEMAIL,
        this.eMPLOYEEPHONENUMBER});

  DeliveryReportsToday.fromJson(Map<String, dynamic> json) {
    checkOut = json['check_Out'];
    checkOutTime = json['check_Out_Time'];
    dELIVERYENTRYTIME = json['DELIVERY_ENTRY_TIME'];
    dELIVERYNAME = json['DELIVERY_NAME'];
    dELIVERYEMAIL = json['DELIVERY_EMAIL'];
    dELIVERYBOYPHOTO = json['DELIVERY_BOY_PHOTO'];
    nDASign = json['NDA_sign'];
    dELIVERYPHONENUMBER = json['DELIVERY_PHONE_NUMBER'];
    dELIVERYCOMPANYNAME = json['DELIVERY_COMPANY_NAME'];
    eMPLOYEENAME = json['EMPLOYEE_NAME'];
    eMPLOYEEEMAIL = json['EMPLOYEE_EMAIL'];
    eMPLOYEEPHONENUMBER = json['EMPLOYEE_PHONE_NUMBER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['check_Out'] = this.checkOut;
    data['check_Out_Time'] = this.checkOutTime;
    data['DELIVERY_ENTRY_TIME'] = this.dELIVERYENTRYTIME;
    data['DELIVERY_NAME'] = this.dELIVERYNAME;
    data['DELIVERY_EMAIL'] = this.dELIVERYEMAIL;
    data['DELIVERY_BOY_PHOTO'] = this.dELIVERYBOYPHOTO;
    data['NDA_sign'] = this.nDASign;
    data['DELIVERY_PHONE_NUMBER'] = this.dELIVERYPHONENUMBER;
    data['DELIVERY_COMPANY_NAME'] = this.dELIVERYCOMPANYNAME;
    data['EMPLOYEE_NAME'] = this.eMPLOYEENAME;
    data['EMPLOYEE_EMAIL'] = this.eMPLOYEEEMAIL;
    data['EMPLOYEE_PHONE_NUMBER'] = this.eMPLOYEEPHONENUMBER;
    return data;
  }
}
