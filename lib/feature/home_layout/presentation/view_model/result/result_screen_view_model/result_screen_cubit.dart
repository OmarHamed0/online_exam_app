import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/GetUserHistoryModel.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/result/get_user_history_use_case.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/result/result_screen_view_model/result_screen_states.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../data/mdoel/response/gel_all_exams_model/Exams.dart';

@injectable
class ResultScreenCubit extends Cubit<ResultScreenStates> {
  GetUserHistoryUseCase useCase;

  ResultScreenCubit({required this.useCase}) : super(ResultScreenInitialStat());
  void getUserHistory() async {
    emit(ResultScreenLoadingStat(loadingMessage: "Loading...."));
    var result = await useCase.invoke();
    if (result is Success<GetUserHistoryModel?>) {

      emit(ResultScreenSuccessStat(getUserHistory: result.data));
    }
    if (result is Fail<GetUserHistoryModel?>) {
      emit(ResultScreenErrorStat(errorMessage: result.exception));
    }
  }

}
