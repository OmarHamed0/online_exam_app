import 'package:flutter/cupertino.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/GetUserHistoryModel.dart';

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
  final GetUserHistoryModel? getUserHistory;
  ResultScreenSuccessStat({required this.getUserHistory});
}
