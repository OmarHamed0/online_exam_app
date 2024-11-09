import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/check_questions_model/CheckQuestionsModel.dart';

@immutable
sealed class CheckQuestionsStates extends Equatable {
  @override
  List<Object?> get props => [];
}


class CheckQuestionsInitialStat extends CheckQuestionsStates {}

class CheckQuestionsErrorStat extends CheckQuestionsStates {
  final Exception? errorMessage;
  CheckQuestionsErrorStat({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];

}

class CheckQuestionsLoadingStat extends CheckQuestionsStates {
  final String? loadingMessage;
  CheckQuestionsLoadingStat({required this.loadingMessage});
  @override
  List<Object?> get props => [loadingMessage];

}

class CheckQuestionsSuccessStat extends CheckQuestionsStates {
  final CheckQuestionsModel? checkQuestions;
  CheckQuestionsSuccessStat({required this.checkQuestions});
  @override
  List<Object?> get props => [checkQuestions];

}
