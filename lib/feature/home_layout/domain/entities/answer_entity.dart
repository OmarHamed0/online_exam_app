import 'package:hive/hive.dart';

@HiveType(typeId: 7)
class AnswersEntity {
  @HiveField(0)
  String? answer;
  @HiveField(1)
  String? key;

  AnswersEntity(this.answer,
      this.key,);
}