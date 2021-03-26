import 'package:flutter/material.dart';
import 'package:taleb/functions/custom_launcher.dart';
import 'package:taleb/models/exams_model.dart';
import 'package:taleb/models/lessons_model.dart';
import 'package:taleb/screens/ask_teacher.dart';
import 'package:taleb/screens/contact.dart';
import 'package:taleb/screens/exams.dart';
import 'package:taleb/screens/lessons.dart';
import 'package:taleb/screens/live.dart';
import 'package:taleb/screens/student_reports.dart';
import 'gridview_single_item.dart';
import 'package:taleb/screens/pdf.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class GridViewItems extends StatefulWidget {
  @override
  _GridViewItemsState createState() => _GridViewItemsState();
}

class _GridViewItemsState extends State<GridViewItems> {
  
  List<ExamModel> exams;
  List<LessonsModel> lessons;

  void getExams()async{
    List<ExamModel> fromJsonArray(String jsonString) => List<ExamModel>.from(json.decode(jsonString).map((e) => ExamModel.fromJson(e)));
    http.Response response = await http.get("http://mohamed153-001-site1.btempurl.com/api/Exams/GetExamsForTeacher");
    print(response.body);
    setState(() {
      exams = fromJsonArray(response.body);
    });
    
  }
  void getLessons()async{
    List<LessonsModel> fromJsonArray(String jsonString) => List<LessonsModel>.from(json.decode(jsonString).map((e) => LessonsModel.fromJson(e)));
    http.Response response = await http.get("http://mohamed153-001-site1.btempurl.com/api/Lessons/GetUnitsWithCourseID/1");
    print(response.body);
    setState(() {
      lessons = fromJsonArray(response.body);
    });
    
  }
  
  @override
  void initState() {
    // TODO: implement initState
    getExams();
    getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: <Widget>[
        SingleGridViewItem(
          name: 'Lessons',
          pictureName: 'images/lessons.png',
          onTaped: () async{
            if (lessons.isEmpty) {
              print("waiting for getting data");
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Lessons(lessons:lessons)));
            }
            
          },
        ),
        SingleGridViewItem(
          name: 'PDF',
          pictureName: 'images/pdf.png',
          onTaped: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Pdf())),
        ),
        SingleGridViewItem(
          name: 'Live',
          pictureName: 'images/live.webp',
          onTaped: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Live())),
        ),
        SingleGridViewItem(
          name: 'Exams',
          pictureName: 'images/exams.png',
          onTaped: () async{ 
            if (exams.isEmpty) {
              print("waiting for getting data");
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Exams(exams: exams)));
            }
            
          }
        ),
        SingleGridViewItem(
          name: 'Homework',
          pictureName: 'images/homework.png',
          onTaped: () => customLauncher('whatsapp://send?phone=+20 100 620 9613'),
        ),
        SingleGridViewItem(
          name: 'Student Reports',
          pictureName: 'images/reports.png',
          onTaped: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => StudentReports())),
        ),
        SingleGridViewItem(
          name: 'Ask Teacher',
          pictureName: 'images/teacher.png',
          onTaped: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AskTeacher())),
        ),
        SingleGridViewItem(
          name: 'Contact US',
          pictureName: 'images/contact.jpg',
          onTaped: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Contacts())),
        ),
      ],
    );
  }
}
