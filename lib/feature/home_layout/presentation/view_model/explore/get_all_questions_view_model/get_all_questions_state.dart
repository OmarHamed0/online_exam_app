import 'package:flutter/cupertino.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';

@immutable
sealed class GetAllQuestionsStates {}
class GetAllQuestionsEmptyState extends GetAllQuestionsStates {}

class GetAllQuestionsInitialState extends GetAllQuestionsStates {}

class GetAllQuestionsErrorState extends GetAllQuestionsStates {
  final String? errorMassage;
  GetAllQuestionsErrorState({required this.errorMassage});
}

class GetAllQuestionsLoadingState extends GetAllQuestionsStates {}

class GetAllQuestionsSuccessState extends GetAllQuestionsStates {
  final GetAllQuestionsModel? getAllQuestions;

  GetAllQuestionsSuccessState({required this.getAllQuestions});
}
  class GetAllQuestionsTimeOutState extends GetAllQuestionsStates {}

class GetAllQuestionsPreviousQuestionState extends GetAllQuestionsStates {
  final int currentQuestionIndex;
  GetAllQuestionsPreviousQuestionState({required this.currentQuestionIndex});
}
class GetAllQuestionsOptionSelectedState extends GetAllQuestionsStates {
  final int currentQuestionIndex;
  final List<int?> selectedOptions;
  GetAllQuestionsOptionSelectedState({
    required this.currentQuestionIndex,
    required this.selectedOptions,
  });
}

