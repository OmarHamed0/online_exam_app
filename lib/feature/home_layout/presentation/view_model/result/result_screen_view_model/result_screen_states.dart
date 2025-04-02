import 'package:flutter/cupertino.dart';

import '../../../../domain/entities/cached_exam_result_entity.dart';

@immutable
sealed class ResultScreenStates {}

class ResultScreenInitialStat extends ResultScreenStates {}

class ResultScreenErrorStat extends ResultScreenStates {
  final Exception? errorMessage;
  ResultScreenErrorStat({required this.errorMessage});
}

class ResultScreenLoadingStat extends ResultScreenStates {
  final String? loadingMessage;
  ResultScreenLoadingStat({required this.loadingMessage});
}

class ResultScreenSuccessStat extends ResultScreenStates {
  List<CachedExamResultEntity> exam;
  ResultScreenSuccessStat(this.exam);
}
class NavigateToResultScreenState extends ResultScreenStates{
  CachedExamResultEntity exam;
  NavigateToResultScreenState(this.exam);
}
class GetExamAnswersState extends ResultScreenStates{}


sealed class ResultScreenActions{}

class GetResultExamByIdAction extends ResultScreenActions{
}
class GetExamQuestionsAction extends ResultScreenActions{
  String examId;
  GetExamQuestionsAction(this.examId);
}

class NavigateToExamResultAction extends ResultScreenActions{
  CachedExamResultEntity exam;
  NavigateToExamResultAction(this.exam);
}