import 'package:flutter/cupertino.dart';

import '../../../data/mdoel/response/subject_model/Subject_model.dart';



@immutable
sealed class ExploreStates {}

class ExploreInitialState extends ExploreStates {}

class ExploreErrorState extends ExploreStates {
  final Exception? errorMessage;
  ExploreErrorState({required this.errorMessage});
}

class ExploreLoadingState extends ExploreStates {
  final String? loadingMessage;
  ExploreLoadingState({required this.loadingMessage});
}

class ExploreSuccessState extends ExploreStates {
  final SubjectModel? getAllSubjects;
  ExploreSuccessState({required this.getAllSubjects});
}
