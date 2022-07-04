class VisitorData {
  VisitorData({
    required this.status,
    required this.success,
    required this.message,
    required this.graphData,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<GraphData> graphData;

  VisitorData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    graphData = List.from(json['Graph_Data']).map((e)=>GraphData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['Graph_Data'] = graphData.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class GraphData {
  GraphData({
    required this.date,
    required this.time,
    required this.checkOut,
    this.checkOutTime,
    required this.visitType,
  });
  late final String date;
  late final String time;
  late final int checkOut;
  late final String? checkOutTime;
  late final String visitType;

  GraphData.fromJson(Map<String, dynamic> json){
    date = json['date'];
    time = json['time'];
    checkOut = json['check_Out'];
    checkOutTime = json['check_Out_Time'];
    visitType = json['visit_Type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['time'] = time;
    _data['check_Out'] = checkOut;
    _data['check_Out_Time'] = checkOutTime;
    _data['visit_Type'] = visitType;
    return _data;
  }
}