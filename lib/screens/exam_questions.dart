import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taleb/models/question_model.dart';
import 'package:taleb/widgets/my_appbar.dart';
import 'package:taleb/widgets/question_form.dart';

class ExamQuestions extends StatefulWidget {
  final List<QuestionModel> questions;
  ExamQuestions({@required this.questions});
  @override
  _ExamQuestionsState createState() => _ExamQuestionsState();
}

class _ExamQuestionsState extends State<ExamQuestions> {

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

  Timer _timer ;
  int start = 20;

  void startTimer(){
    const oneSecond = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSecond, (Timer timer){
      if (start==0) {
        setState(() {
          timer.cancel();
          Navigator.pop(context);
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
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
          title: Center(child: Text("$start"),),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20),topLeft: Radius.circular(8),topRight: Radius.circular(8))),
          actions: [
            FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("ارفع الاجابة")),
            IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){Navigator.pop(context);}),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/onlinecourse.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)
            ),
          ),
          child: ListView.builder(
            itemCount: widget.questions.length,
            itemBuilder: (context, index)=> QuestionForm(question: widget.questions[index],),
          ),
        ),
      ),
    );
  }
}