class PendingReqCount {
  PendingReqCount({
    required this.status,
    required this.success,
    required this.message,
    required this.pendingRequests,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<PendingRequests> pendingRequests;

  PendingReqCount.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    pendingRequests = List.from(json['pendingRequests']).map((e)=>PendingRequests.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['pendingRequests'] = pendingRequests.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PendingRequests {
  PendingRequests({
    required this.COUNT,
  });
  late final int COUNT;

  PendingRequests.fromJson(Map<String, dynamic> json){
    COUNT = json['COUNT(id)'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['COUNT(id)'] = COUNT;
    return _data;
  }
}