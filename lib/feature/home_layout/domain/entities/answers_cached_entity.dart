import 'package:hive/hive.dart';

import 'answer_entity.dart';

@HiveType(typeId: 5)
class AnswerCachedEntity {
  @HiveField(0)
  String? correctKey;
  @HiveField(1)
  String? userChoiceKey;
  @HiveField(2)
  String? examId;
  @HiveField(3)
  List<AnswersEntity>? answers;
  @HiveField(4)
  String? question;
  AnswerCachedEntity(this.correctKey, this.userChoiceKey, this.examId,
      this.answers, this.question);
}
