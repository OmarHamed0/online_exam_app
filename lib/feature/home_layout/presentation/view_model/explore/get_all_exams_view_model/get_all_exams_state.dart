import 'package:flutter/material.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';

@immutable
sealed class GetAllExamsStates {}
class GetAllExamsInitialStat extends GetAllExamsStates {}

class GetAllExamsErrorStat extends GetAllExamsStates {
  final Exception? errorMessage;
  GetAllExamsErrorStat({required this.errorMessage});
}

class GetAllExamsLoadingStat extends GetAllExamsStates {
  final String? loadingMessage;
  GetAllExamsLoadingStat({required this.loadingMessage});
}

class GetAllExamsSuccessStat extends GetAllExamsStates {
  final GetAllExamsModel? getAllExamsModel;
  GetAllExamsSuccessStat({required this.getAllExamsModel});
}
