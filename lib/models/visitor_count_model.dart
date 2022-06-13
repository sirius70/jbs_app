// To parse this JSON data, do
//
//     final visitorTodaysCount = visitorTodaysCountFromJson(jsonString);

import 'dart:convert';

VisitorTodaysCount visitorTodaysCountFromJson(String str) => VisitorTodaysCount.fromJson(json.decode(str));

String visitorTodaysCountToJson(VisitorTodaysCount data) => json.encode(data.toJson());

class VisitorTodaysCount {
  VisitorTodaysCount({
    required this.status,
    required this.success,
    required  this.message,
    required this.visitorInsideToday,
    required this.totalVisitorVisitedToday,
  });

  String status;
  bool success;
  String message;
  List<Today> visitorInsideToday;
  List<Today> totalVisitorVisitedToday;

  factory VisitorTodaysCount.fromJson(Map<String, dynamic> json) => VisitorTodaysCount(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    visitorInsideToday: List<Today>.from(json["Visitor_Inside_Today"].map((x) => Today.fromJson(x))),
    totalVisitorVisitedToday: List<Today>.from(json["Total_Visitor_Visited_Today"].map((x) => Today.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "Visitor_Inside_Today": List<dynamic>.from(visitorInsideToday.map((x) => x.toJson())),
    "Total_Visitor_Visited_Today": List<dynamic>.from(totalVisitorVisitedToday.map((x) => x.toJson())),
  };
}

class Today {
  Today({
    required this.count,
  });

  int count;

  factory Today.fromJson(Map<String, dynamic> json) => Today(
    count: json["COUNT(*)"],
  );

  Map<String, dynamic> toJson() => {
    "COUNT(*)": count,
  };
}
