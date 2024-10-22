import 'package:flutter/cupertino.dart';

import '../../../../data/mdoel/response/subject_model/Subject_model.dart';



@immutable
sealed class GetAllSubjectsStates {}

class GetAllSubjectsInitialState extends GetAllSubjectsStates {}

class GetAllSubjectsErrorState extends GetAllSubjectsStates {
  final Exception? errorMessage;
  GetAllSubjectsErrorState({required this.errorMessage});
}

class GetAllSubjectsLoadingState extends GetAllSubjectsStates {
  final String? loadingMessage;
  GetAllSubjectsLoadingState({required this.loadingMessage});
}

class GetAllSubjectsSuccessState extends GetAllSubjectsStates {
  final SubjectModel? getAllSubjects;
  GetAllSubjectsSuccessState({required this.getAllSubjects});
}
