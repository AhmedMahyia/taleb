import 'package:flutter/material.dart';
import 'package:taleb/models/unit_lessons_model.dart';
import 'package:taleb/screens/lesson_content.dart';
import 'package:taleb/widgets/drawer.dart';
import 'package:taleb/widgets/my_appbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UnitLessons extends StatefulWidget {
  final List<UnitLessonsModel> unitLessons;
  UnitLessons({@required this.unitLessons});
  @override
  _UnitLessonsState createState() => _UnitLessonsState();
}

class _UnitLessonsState extends State<UnitLessons> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('الحصص'),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/onlinecourse.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
        child: ListView.builder(
          itemCount: widget.unitLessons.length,
          itemBuilder: (context,index){
            print(widget.unitLessons[index].className);
            return Padding(
              padding: const EdgeInsets.fromLTRB(8,8,8,0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LessonContent()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: MediaQuery.of(context).size.width*3/4,
                  height: 40,
                  child: Center(child: Text(widget.unitLessons[index].className,style: TextStyle(color: Colors.black,fontSize: 20),)),
                ),
              ),
            );
          }
        ),
      )
    );
  }
}