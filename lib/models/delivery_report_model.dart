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
    required this.deliveryEntryTime,
    required this.deliveryName,
    required this.deliveryEmail,
    this.deliveryBoyPhoto,
    required this.deliveryNdaSign,
    required this.deliveryPhoneNumber,
    required this.deliveryCompanyName,
    required this.employeeName,
    required this.employeeEmail,
    required this.employeeId,
    required this.employeePhoneNumber,
  });
  late final int checkOut;
  late final String checkOutTime;
  late final String deliveryEntryTime;
  late final String deliveryName;
  late final String deliveryEmail;
  late final Null deliveryBoyPhoto;
  late final int deliveryNdaSign;
  late final String deliveryPhoneNumber;
  late final String deliveryCompanyName;
  late final String employeeName;
  late final String employeeEmail;
  late final int employeeId;
  late final String employeePhoneNumber;

  DeliveryReportsToday.fromJson(Map<String, dynamic> json){
    checkOut = json['check_Out'];
    checkOutTime = json['check_Out_Time'];
    deliveryEntryTime = json['delivery_Entry_Time'];
    deliveryName = json['delivery_Name'];
    deliveryEmail = json['delivery_Email'];
    deliveryBoyPhoto = null;
    deliveryNdaSign = json['delivery_Nda_Sign'];
    deliveryPhoneNumber = json['delivery_Phone_Number'];
    deliveryCompanyName = json['delivery_Company_Name'];
    employeeName = json['employee_Name'];
    employeeEmail = json['employee_Email'];
    employeeId = json['employee_Id'];
    employeePhoneNumber = json['employee_Phone_Number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['check_Out'] = checkOut;
    _data['check_Out_Time'] = checkOutTime;
    _data['delivery_Entry_Time'] = deliveryEntryTime;
    _data['delivery_Name'] = deliveryName;
    _data['delivery_Email'] = deliveryEmail;
    _data['delivery_Boy_Photo'] = deliveryBoyPhoto;
    _data['delivery_Nda_Sign'] = deliveryNdaSign;
    _data['delivery_Phone_Number'] = deliveryPhoneNumber;
    _data['delivery_Company_Name'] = deliveryCompanyName;
    _data['employee_Name'] = employeeName;
    _data['employee_Email'] = employeeEmail;
    _data['employee_Id'] = employeeId;
    _data['employee_Phone_Number'] = employeePhoneNumber;
    return _data;
  }
}