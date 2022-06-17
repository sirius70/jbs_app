class DeliveryInsideReport {
  DeliveryInsideReport({
    required this.status,
    required this.success,
    required this.message,
    required this.deliveryReportsToday,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<DeliveryReportsToday> deliveryReportsToday;

  DeliveryInsideReport.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    deliveryReportsToday = List.from(json['Delivery_Reports_Today']).map((e)=>DeliveryReportsToday.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['Delivery_Reports_Today'] = deliveryReportsToday.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class DeliveryReportsToday {
  DeliveryReportsToday({
    required this.checkOut,
    required this.checkOutTime,
    required this.DELIVERYENTRYTIME,
    required this.DELIVERYNAME,
    required this.DELIVERYEMAIL,
    this.DELIVERYBOYPHOTO,
    required this.NDASign,
    required this.DELIVERYPHONENUMBER,
    required this.DELIVERYCOMPANYNAME,
    required this.EMPLOYEENAME,
    required this.EMPLOYEEEMAIL,
    required this.EMPLOYEEPHONENUMBER,
  });
  late final int checkOut;
  late final String checkOutTime;
  late final String DELIVERYENTRYTIME;
  late final String DELIVERYNAME;
  late final String DELIVERYEMAIL;
  late final Null DELIVERYBOYPHOTO;
  late final int NDASign;
  late final String DELIVERYPHONENUMBER;
  late final String DELIVERYCOMPANYNAME;
  late final String EMPLOYEENAME;
  late final String EMPLOYEEEMAIL;
  late final String EMPLOYEEPHONENUMBER;

  DeliveryReportsToday.fromJson(Map<String, dynamic> json){
    checkOut = json['check_Out'];
    checkOutTime = json['check_Out_Time'];
    DELIVERYENTRYTIME = json['DELIVERY_ENTRY_TIME'];
    DELIVERYNAME = json['DELIVERY_NAME'];
    DELIVERYEMAIL = json['DELIVERY_EMAIL'];
    DELIVERYBOYPHOTO = null;
    NDASign = json['NDA_sign'];
    DELIVERYPHONENUMBER = json['DELIVERY_PHONE_NUMBER'];
    DELIVERYCOMPANYNAME = json['DELIVERY_COMPANY_NAME'];
    EMPLOYEENAME = json['EMPLOYEE_NAME'];
    EMPLOYEEEMAIL = json['EMPLOYEE_EMAIL'];
    EMPLOYEEPHONENUMBER = json['EMPLOYEE_PHONE_NUMBER'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['check_Out'] = checkOut;
    _data['check_Out_Time'] = checkOutTime;
    _data['DELIVERY_ENTRY_TIME'] = DELIVERYENTRYTIME;
    _data['DELIVERY_NAME'] = DELIVERYNAME;
    _data['DELIVERY_EMAIL'] = DELIVERYEMAIL;
    _data['DELIVERY_BOY_PHOTO'] = DELIVERYBOYPHOTO;
    _data['NDA_sign'] = NDASign;
    _data['DELIVERY_PHONE_NUMBER'] = DELIVERYPHONENUMBER;
    _data['DELIVERY_COMPANY_NAME'] = DELIVERYCOMPANYNAME;
    _data['EMPLOYEE_NAME'] = EMPLOYEENAME;
    _data['EMPLOYEE_EMAIL'] = EMPLOYEEEMAIL;
    _data['EMPLOYEE_PHONE_NUMBER'] = EMPLOYEEPHONENUMBER;
    return _data;
  }
}