class CheckQuestionsRequest {
  CheckQuestionsRequest({
      this.answers,});

  CheckQuestionsRequest.fromJson(dynamic json) {
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers?.add(CheckQuestionAnswer.fromJson(v));
      });
    }
  }
  List<CheckQuestionAnswer>? answers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CheckQuestionAnswer {
  CheckQuestionAnswer({
      this.questionId, 
      this.correct,});

  CheckQuestionAnswer.fromJson(dynamic json) {
    questionId = json['questionId'];
    correct = json['correct'];
  }
  String? questionId;
  String? correct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['questionId'] = questionId;
    map['correct'] = correct;
    return map;
  }

}