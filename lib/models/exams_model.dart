class ExamModel{
  String name;
  int id;
  String date;
  double finalDegree;
  double passDegree;
  double duration;

  ExamModel({this.date,this.duration,this.finalDegree,this.id,this.name,this.passDegree});

  factory ExamModel.fromJson(Map<String, dynamic> json)=> ExamModel(date: json["submitDate"],duration: json["duration"],finalDegree: json["finalDegree"],name: json["name"],id: json["id"],passDegree: json["passDegree"]);

}