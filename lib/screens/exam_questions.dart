import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taleb/models/question_model.dart';
import 'package:taleb/widgets/question_form.dart';

class ExamQuestions extends StatefulWidget {
  final List<QuestionModel> questions;
  final double duration;
  ExamQuestions({@required this.questions, @required this.duration});
  @override
  _ExamQuestionsState createState() => _ExamQuestionsState();
}

class _ExamQuestionsState extends State<ExamQuestions> {
  Timer _timer;
  int start = 20;
  List<bool> result = [];
  int noTrue = 0;
  int noFalse = 0;
  bool isCanceled = false;
  // bool toastMessage(String msg){
  //   Fluttertoast.showToast(
  //     msg: msg,
  //     textColor: Colors.white,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.grey[700]
  //   );
  //   return false;
  // }

  Future<bool> getQuestionResultFromSharedPreferences(
      QuestionModel questionModel) async {
    final prefs = await SharedPreferences.getInstance();
    final bool questionResult =
        prefs.getBool("questionResult_${questionModel.questionId}");
    return questionResult;
  }

  Future<double> resultReturn() async {
    for (var question in widget.questions) {
      bool questions = await getQuestionResultFromSharedPreferences(question);
      result.add(questions);
      print("result: ${result.toString}");
    }
    getResult();
    return noTrue * (120 / (widget.questions.length));
  }
  // showDialog(context: context,barrierDismissible: false,builder: (BuildContext context)=>SimpleDialog(
  //   title: Center(child: Text("النتيجة"),),
  //   children: [
  //     Center(child:Text(myResult.toString())),
  //   ],
  // ));

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSecond, (Timer timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          isCanceled = true;

        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  void getResult() {
    for (var item in result) {
      if (item) {
        noTrue++;
      } else {
        noFalse++;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.blue,
          title: Center(
            child: Text("$start"),
          ),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20),topLeft: Radius.circular(8),topRight: Radius.circular(8))),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ارفع الاجابة")),
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/onlinecourse.jpg"),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black45, BlendMode.darken)),
          ),
          child: !isCanceled
              ? ListView.builder(
                  itemCount: widget.questions.length,
                  itemBuilder: (context, index) => QuestionForm(
                    question: widget.questions[index],
                  ),
                )
              : Center(
                child: FutureBuilder<double>(
                    future: resultReturn(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Your result is :',style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),),
                            Text(
                              snapshot.data.toString(),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        );
                      return CircularProgressIndicator();
                    }),
              ),
        ),
      ),
    );
  }
}
