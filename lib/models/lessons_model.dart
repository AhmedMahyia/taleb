class LessonsModel {
  String contentName;
  int contentId;

  LessonsModel({this.contentName, this.contentId});

  factory LessonsModel.fromJson(Map<String, dynamic> json) => LessonsModel(
      contentName: json["contentName"], contentId: json["contentId"]);
}
