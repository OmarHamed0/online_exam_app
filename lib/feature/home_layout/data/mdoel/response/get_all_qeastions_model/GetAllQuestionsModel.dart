import 'Questions.dart';

class GetAllQuestionsModel {
  GetAllQuestionsModel({
      this.message, 
      this.questions,});

  GetAllQuestionsModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Questions.fromJson(v));
      });
    }
  }
  String? message;
  List<Questions>? questions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}