class SendServiceReq {
  SendServiceReq({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final Data data;

  SendServiceReq.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.reqId,
  });
  late final int reqId;

  Data.fromJson(Map<String, dynamic> json){
    reqId = json['reqId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['reqId'] = reqId;
    return _data;
  }
}