import 'package:flutter/material.dart';
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late List<charts.Series<dynamic, String>> seriesList;

  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();
    final desktopSalesData = [
      Sales("Jan", 28, Color(0xff9AD7FF), LinearGradient(
        colors: <Color>[
          Color(0xff038c8c), Color(0xff666dad)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),),
      Sales("Feb", 48, Color(0xff9AD7FF), LinearGradient(
        colors: <Color>[
          Color(0xff038c8c), Color(0xff666dad)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),),
      Sales("Mar", 78, Color(0xff9AD7FF), LinearGradient(
        colors: <Color>[
          Color(0xff038c8c), Color(0xff666dad)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),),
      Sales("Apr", 100, Color(0xff9AD7FF), LinearGradient(
        colors: <Color>[
          Color(0xff038c8c), Color(0xff666dad)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),),
      Sales("May", 65, Color(0xff9AD7FF), LinearGradient(
        colors: <Color>[
          Color(0xff038c8c), Color(0xff666dad)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),),
      Sales("Jun", 55, Color(0xff9AD7FF), LinearGradient(
        colors: <Color>[
          Color(0xff038c8c), Color(0xff666dad)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),),
    ];

    return [charts.Series<Sales, String>(
      id: "Sales",
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.sales,
      colorFn: (Sales sales, _) => charts.ColorUtil.fromDartColor(sales.color),
      data: desktopSalesData,
    )];
  }

  barChart(){
    return charts.BarChart(
      seriesList,
     // animate: true,
      vertical: false,
      primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec: new charts.StaticNumericTickProviderSpec(
            <charts.TickSpec<num>>[
              charts.TickSpec<num>(0),
              charts.TickSpec<num>(25),
              charts.TickSpec<num>(50),
              charts.TickSpec<num>(75),
              charts.TickSpec<num>(100),
            ],
          ),
          renderSpec: new charts.GridlineRendererSpec(
              labelStyle: new charts.TextStyleSpec(

                color: charts.MaterialPalette.black),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white))),

      barGroupingType: charts.BarGroupingType.stacked,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.stacked,
        strokeWidthPx: 1.0,
      ),

          );
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      //color: Colors.white,
      padding: EdgeInsets.all(10),
      child:barChart(),
    );
  }
}

class Sales {
  final String year;
  final int sales;
  final Color color;
  final Gradient gradient;


  Sales(this.year, this.sales, this.color, this.gradient);

}