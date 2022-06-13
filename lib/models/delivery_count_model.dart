class DeliveryTodaysCount {
  DeliveryTodaysCount({
    required this.status,
    required this.success,
    required this.message,
    required this.deliveries,
    required this.data,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final String deliveries;
  late final List<Data> data;

  DeliveryTodaysCount.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    deliveries = json['deliveries'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['deliveries'] = deliveries;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
  required this.count,
});
late final int count;

Data.fromJson(Map<String, dynamic> json){
count = json['COUNT(*)'];
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['COUNT(*)'] = count;
  return _data;
}
}