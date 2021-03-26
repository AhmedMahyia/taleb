
import 'package:flutter/material.dart';
import 'package:taleb/models/question_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionForm extends StatefulWidget {
  final QuestionModel question;
  QuestionForm({this.question});
  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  int groupValue = 0 ;

  Future<bool> getQuestionResultFromSharedPreferences()async{
    final prefs = await SharedPreferences.getInstance();
    final bool questionResult = prefs.getBool("questionResult");
    return questionResult;
  }

  Future setQuestionResultToSharedPreferences(int groupValue1)async{
    final prefs = await SharedPreferences.getInstance();
    if (groupValue==0) {
      print("Question has not been answered");
      prefs.setBool("questionResult_${widget.question.questionId}",null);
      print("${widget.question.correctChoice}");
    } else {
      if (groupValue1 == widget.question.correctChoice) {
        prefs.setBool("questionResult_${widget.question.questionId}",true);
        print("true");
      } else {
        prefs.setBool("questionResult_${widget.question.questionId}",false);
        print("false");
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    setQuestionResultToSharedPreferences(groupValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${widget.question.questionText}",textAlign: TextAlign.right,style: TextStyle(fontSize: 20),),
              ),
            ),
            Divider(height: 4,indent: 50,endIndent: 50,thickness: 2,),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("${widget.question.choice_1}"),
                    
                    Radio(value: 1, groupValue: groupValue, onChanged: (T){
                      setState(() {
                        groupValue = 1;
                        setQuestionResultToSharedPreferences(groupValue);
                        print(groupValue);
                      });
                    }),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("${widget.question.choice_2}"),
                    
                    Radio(value: 2, groupValue: groupValue, onChanged: (T){
                      setState(() {
                        groupValue = 2;
                        setQuestionResultToSharedPreferences(groupValue);
                        print(groupValue);
                      });
                    }),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("${widget.question.choice_3}"),
                    
                    Radio(value: 3, groupValue: groupValue, onChanged: (T){
                      setState(() {
                        groupValue = 3;
                        setQuestionResultToSharedPreferences(groupValue);
                        print(groupValue);
                      });
                    }),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("${widget.question.choice_4}"),
                    
                    Radio(value: 4, groupValue: groupValue, onChanged: (T){
                      setState(() {
                        groupValue = 4;
                        setQuestionResultToSharedPreferences(groupValue);
                        print(groupValue);
                      });
                    }),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}