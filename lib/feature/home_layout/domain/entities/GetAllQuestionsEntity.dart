class GetAllQuestionsEntity {
  GetAllQuestionsEntity({
    this.message,
    this.questions,
  });

  String? message;
  List<Questions>? questions;
}

class Questions {
  Questions({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  List<Answers>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  Subject? subject;
  Exam? exam;
  String? createdAt;
}

class Exam {
  Exam({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  String? id;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  String? createdAt;
}

class Subject {
  Subject({
    this.id,
    this.name,
    this.icon,
    this.createdAt,
  });

  String? id;
  String? name;
  String? icon;
  String? createdAt;
}

class Answers {
  Answers({
    this.answer,
    this.key,
  });

  String? answer;
  String? key;
}
