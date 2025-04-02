import 'package:hive/hive.dart';
import 'package:online_exam/feature/home_layout/domain/entities/GetExamById.dart';

import 'answers_cached_entity.dart';

@HiveType(typeId: 4)
class CachedExamResultEntity {
  @HiveField(0)
  List<AnswerCachedEntity>? answers;
  @HiveField(1)
  String? type;
  @HiveField(2)
  String? id;
  @HiveField(3)
  String? question;
  @HiveField(4)
  String? correct;
  @HiveField(5)
  Exam? exam;

  CachedExamResultEntity(this.answers, this.type, this.id, this.question,
      this.correct, this.exam,);
}