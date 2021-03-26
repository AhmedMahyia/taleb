class UnitLessonsModel {
  String className;
  String pdfPath;

  UnitLessonsModel({this.className,this.pdfPath});
  factory UnitLessonsModel.fromJson(Map<String, dynamic> json)=> UnitLessonsModel(className: json["className"],pdfPath: json["pdfPath"]);

}