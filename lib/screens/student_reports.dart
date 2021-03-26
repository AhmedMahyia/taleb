import 'package:flutter/material.dart';
import 'package:taleb/widgets/Student_report_series.dart';
import 'package:taleb/widgets/my_appbar.dart';
import 'package:taleb/widgets/drawer.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:taleb/widgets/student_report_chart.dart';

class StudentReports extends StatefulWidget {
  @override
  _StudentReportsState createState() => _StudentReportsState();
}

class _StudentReportsState extends State<StudentReports> {

final List<StudentReportSeries>data=[
  StudentReportSeries(name: 'muhammad',degree: 15,color: charts.ColorUtil.fromDartColor(Colors.blue)),
  StudentReportSeries(name: 'Mahmoud',degree: 20,color: charts.ColorUtil.fromDartColor(Colors.blue)),
  StudentReportSeries(name: 'Ahmed',degree: 25,color: charts.ColorUtil.fromDartColor(Colors.blue)),
  StudentReportSeries(name: 'Ali',degree: 10,color: charts.ColorUtil.fromDartColor(Colors.blue)),
  StudentReportSeries(name: 'Saied',degree: 10,color: charts.ColorUtil.fromDartColor(Colors.blue)),
  StudentReportSeries(name: 'Ashraf',degree: 10,color: charts.ColorUtil.fromDartColor(Colors.blue)),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar('Student Reports'),
        drawer: MyDrawer(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/onlinecourse.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            ),
          ),
          child:StudentReportChart(data: data,) ,
        ),
    );
  }
}


