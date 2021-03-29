import 'package:flutter/material.dart';
import 'package:taleb/models/lessons_model.dart';
import 'package:taleb/models/unit_lessons_model.dart';
import 'package:taleb/screens/unit_lessons.dart';
import 'package:taleb/widgets/my_appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Lessons extends StatefulWidget {
  final List<LessonsModel> lessons;
  Lessons({@required this.lessons});

  @override
  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  //List<UnitLessonsModel> unitLessons;
  List<UnitLessonsModel> fromJsonArray(String jsonString) =>
      List<UnitLessonsModel>.from(
          json.decode(jsonString).map((e) => UnitLessonsModel.fromJson(e)));

  Future<List<UnitLessonsModel>> getUnitLessons(int index) async {
    http.Response response = await http.get(
        "http://mohamed153-001-site1.btempurl.com/api/Lessons/GetUnitClasses/$index");
    return fromJsonArray(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar('الوحدات'),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/onlinecourse.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            ),
          ),
          child: ListView.builder(
              itemCount: widget.lessons.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: GestureDetector(
                    onTap: () async {
                      List<UnitLessonsModel >myLessons;
                      myLessons =
                          await getUnitLessons(widget.lessons[index].contentId);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UnitLessons(unitLessons: myLessons)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width * 3 / 4,
                      height: 40,
                      child: Center(
                          child: Text(
                        widget.lessons[index].contentName,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                    ),
                  ),
                );
              }),
        ));
  }
}
