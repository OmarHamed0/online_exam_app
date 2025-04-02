class GetUserHistoryModel {
  GetUserHistoryModel({
      this.message, 
      this.history,});

  GetUserHistoryModel.fromJson(dynamic json) {
    message = json['message'];
    history = json['history'] != null ? History.fromJson(json['history']) : null;
  }
  String? message;
  History? history;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (history != null) {
      map['history'] = history?.toJson();
    }
    return map;
  }

}

class History {
  History({
      this.id, 
      this.checkAnswer, 
      this.qid, 
      this.user, 
      this.chosenAnswer,
      this.avgAnswerTime,
      this.createdAt,});

  History.fromJson(dynamic json) {
    id = json['_id'];
    checkAnswer = json['checkAnswer'];
    qid = json['QID'] != null ? Qid.fromJson(json['QID']) : null;
    user = json['user'];
    chosenAnswer = json['chosenAnswer'];
    avgAnswerTime = json['avgAnswerTime'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? checkAnswer;
  Qid? qid;
  String? user;
  String? chosenAnswer;
  String? avgAnswerTime;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['checkAnswer'] = checkAnswer;
    if (qid != null) {
      map['QID'] = qid?.toJson();
    }
    map['user'] = user;
    map['chosenAnswer'] = chosenAnswer;
    map['avgAnswerTime'] = avgAnswerTime;
    map['createdAt'] = createdAt;
    return map;
  }

}

class Qid {
  Qid({
      this.answers, 
      this.type, 
      this.id, 
      this.question, 
      this.correct, 
      this.subject, 
      this.exam, 
      this.createdAt,});

  Qid.fromJson(dynamic json) {
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers?.add(Answers.fromJson(v));
      });
    }
    type = json['type'];
    id = json['_id'];
    question = json['question'];
    correct = json['correct'];
    subject = json['subject'];
    exam = json['exam'];
    createdAt = json['createdAt'];
  }
  List<Answers>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  String? subject;
  String? exam;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    map['type'] = type;
    map['_id'] = id;
    map['question'] = question;
    map['correct'] = correct;
    map['subject'] = subject;
    map['exam'] = exam;
    map['createdAt'] = createdAt;
    return map;
  }

}

class Answers {
  Answers({
      this.answer, 
      this.key,});

  Answers.fromJson(dynamic json) {
    answer = json['answer'];
    key = json['key'];
  }
  String? answer;
  String? key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['answer'] = answer;
    map['key'] = key;
    return map;
  }

}