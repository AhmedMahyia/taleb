import 'package:flutter/material.dart';
import 'package:taleb/widgets/Student_report_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StudentReportChart extends StatelessWidget {
  final List<StudentReportSeries> data;

  StudentReportChart({this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<StudentReportSeries, String>> series = [
      charts.Series(
        id: 'Test Degree',
        data: data,
        domainFn: (StudentReportSeries studentReportSeries, _) =>
            studentReportSeries.name,
        measureFn: (StudentReportSeries studentReportSeries, _) =>
            studentReportSeries.degree,
        colorFn: (StudentReportSeries studentReportSeries, _) =>
            studentReportSeries.color,
      )
    ];
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              'This is month exam result :',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            Expanded(
              child: charts.BarChart(
                series,
                animate: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
