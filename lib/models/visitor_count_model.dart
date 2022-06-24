class VisitorTodaysCount {
  VisitorTodaysCount({
    required this.status,
    required this.success,
    required this.message,
    required this.visitorInside,
    required this.visitorVisited,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<VisitorInside> visitorInside;
  late final List<VisitorVisited> visitorVisited;

  VisitorTodaysCount.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    visitorInside = List.from(json['Visitor_Inside']).map((e)=>VisitorInside.fromJson(e)).toList();
    visitorVisited = List.from(json['Visitor_Visited']).map((e)=>VisitorVisited.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['Visitor_Inside'] = visitorInside.map((e)=>e.toJson()).toList();
    _data['Visitor_Visited'] = visitorVisited.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class VisitorInside {
  VisitorInside({
  required this.COUNT,
});
late final int COUNT;

VisitorInside.fromJson(Map<String, dynamic> json){
COUNT = json['count(id)'];
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['count(id)'] = COUNT;
  return _data;
}
}

class VisitorVisited {
  VisitorVisited({
  required this.COUNT,
});
late final int COUNT;

VisitorVisited.fromJson(Map<String, dynamic> json){
COUNT = json['count(id)'];
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['count(id)'] = COUNT;
  return _data;
}
}