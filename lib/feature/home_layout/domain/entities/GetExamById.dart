class GetExamById {
  GetExamById({
      this.message, 
      this.exam,});

  GetExamById.fromJson(dynamic json) {
    message = json['message'];
    exam = json['exam'] != null ? Exam.fromJson(json['exam']) : null;
  }
  String? message;
  Exam? exam;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (exam != null) {
      map['exam'] = exam?.toJson();
    }
    return map;
  }

}

class Exam {
  Exam({
      this.id, 
      this.title, 
      this.duration, 
      this.subject, 
      this.numberOfQuestions, 
      this.active, 
      this.createdAt,});

  Exam.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    duration = json['duration'];
    subject = json['subject'];
    numberOfQuestions = json['numberOfQuestions'];
    active = json['active'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['duration'] = duration;
    map['subject'] = subject;
    map['numberOfQuestions'] = numberOfQuestions;
    map['active'] = active;
    map['createdAt'] = createdAt;
    return map;
  }

}