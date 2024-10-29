import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/check_questions_view_model/check_questions_states.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../data/mdoel/request/CheckQuestionsRequesrt.dart';
import '../../../../data/mdoel/response/check_questions_model/CheckQuestionsModel.dart';
import '../../../../domain/use_case/explore/check_question_use_case.dart';

@injectable
class CheckQuestionsCubit extends Cubit<CheckQuestionsStates> {
 final CheckQuestionsUseCase useCase;
  CheckQuestionsCubit({required this.useCase}) : super(CheckQuestionsInitialStat());
  void checkQuestions(CheckQuestionsRequest request) async {
    emit(CheckQuestionsLoadingStat(loadingMessage: "Loading...."));
    var result = await useCase.invoke(request);
    if (result is Success<CheckQuestionsModel?>) {
      emit(CheckQuestionsSuccessStat(checkQuestions: result.data));
    }
    if (result is Fail<CheckQuestionsModel?>) {
      emit(CheckQuestionsErrorStat(errorMessage: result.exception));
    }
  }
}
