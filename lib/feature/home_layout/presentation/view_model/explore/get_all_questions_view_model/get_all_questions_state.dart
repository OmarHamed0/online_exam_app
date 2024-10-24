
import 'package:flutter/cupertino.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';

@immutable
sealed class GetAllQuestionsStates{}

class GetAllQuestionsInitialState extends GetAllQuestionsStates{}
class GetAllQuestionsErrorState extends GetAllQuestionsStates{
  final Exception?exception;
  GetAllQuestionsErrorState({required this.exception});
}
class GetAllQuestionsLoadingState extends GetAllQuestionsStates{
  final String?loadingMessage;
  GetAllQuestionsLoadingState({required this.loadingMessage});
}
class GetAllQuestionsSuccessState extends GetAllQuestionsStates{
  final GetAllQuestionsModel? getAllQuestions;
  GetAllQuestionsSuccessState({required this.getAllQuestions});
}
