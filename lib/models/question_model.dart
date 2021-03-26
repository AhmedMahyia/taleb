class QuestionModel{
  final String questionText;
  final String choice_1;
  final String choice_2;
  final String choice_3;
  final String choice_4;
  final int correctChoice;
  final int questionId;
  

  QuestionModel({this.choice_1, this.choice_2, this.choice_3, this.choice_4, this.correctChoice, this.questionId,this.questionText});

  factory QuestionModel.fromJson(Map<String, dynamic> json)=> QuestionModel(choice_1: json["choose1"], choice_2: json["choose2"], choice_3: json["choose3"], choice_4: json["choose4"],correctChoice: json["correctChoise"],questionId: json["questionId"],questionText: json["questionText"]);
  
}