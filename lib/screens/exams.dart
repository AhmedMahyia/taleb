import 'package:flutter/material.dart';
import 'package:taleb/models/exams_model.dart';
import 'package:taleb/models/main_question_model.dart';
import 'package:taleb/models/question_model.dart';
import 'package:taleb/screens/exam_questions.dart';
import 'package:taleb/widgets/my_appbar.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class Exams extends StatefulWidget {
  final List<ExamModel> exams;
  Exams({@required this.exams});
  @override
  _ExamsState createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Exams'),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/onlinecourse.jpg"),
            fit: BoxFit.cover,
            colorFilter:
            ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
        child: ListView.builder(
          itemCount: widget.exams.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: ()async{
                
                List<MainQuestionModel> fromJsonArray(String jsonString) => List<MainQuestionModel>.from(json.decode(jsonString).map((e) => MainQuestionModel.fromJson(e)));
                http.Response response = await http.get("http://mohamed153-001-site1.btempurl.com/api/Questions/GetExamQuestions/${widget.exams[index].id}");
                List<MainQuestionModel> questionsModel = fromJsonArray(response.body);
                List<QuestionModel> questions = [];
                print(questions);
                for (var question in questionsModel) {
                  questions.add(QuestionModel.fromJson(question.question));
                }
                print(questions[0].choice_1);
                
                //QuestionModel fromJsonArray2(String jsonString) => QuestionModel.fromJson(json.decode(jsonString));
                // List<QuestionModel> examQuestions =[];
                // for (var question in questions) {
                //   examQuestions.add(fromJsonArray2(question.question));
                // }
                
                showDialog(context: context,barrierDismissible: false, builder:(BuildContext context)=> SimpleDialog(
                  title: Center(child: Text("خلى بالك",style: TextStyle(fontSize: 24),)),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("بمجرد ما تضغط موافق هتبدأ الامتحان ع طول",textAlign: TextAlign.right,style: TextStyle(fontSize: 12),),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          color: Colors.green, //Color.fromRGBO(49, 39, 79, .9),
                          child: Text("موافق", style:TextStyle(color: Colors.white) ,),
                          onPressed: (){
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ExamQuestions(questions: questions)));
                            
                          },
                        ),
                        RaisedButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          color: Colors.red,
                          child: Text("الغاء",style:TextStyle(color: Colors.white)),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ));
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(widget.exams[index].name , style: TextStyle(color: Colors.cyan,fontSize: 20),),
                        ),
                        Divider(color: Colors.grey[600],height: 2,thickness: 2,endIndent: MediaQuery.of(context).size.width/5,indent: MediaQuery.of(context).size.width/5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("مدة الامتحان"),
                                Text(widget.exams[index].duration.toString()),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("الدرجة النهائية"),
                                Text(widget.exams[index].finalDegree.toString()),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("درجة النجاح"),
                                Text(widget.exams[index].passDegree.toString()),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
