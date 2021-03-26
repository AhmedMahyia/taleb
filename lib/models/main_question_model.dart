class MainQuestionModel{
  final Map<String ,dynamic> question;
  MainQuestionModel({this.question});

  factory MainQuestionModel.fromJson(Map<String ,dynamic> json)=> MainQuestionModel(question: json["question"]);
}