
/********************
@injectable
class ResultScreenCubit extends Cubit<ResultScreenStates> {
  GetUserHistoryUseCase useCase;
  ResultScreenCubit({required this.useCase}) : super(ResultScreenInitialStat());
  void getUserHistory() async {
    emit(ResultScreenLoadingStat(loadingMessage: "Loading...."));
    var result = await useCase.invoke();
    if (result is Success<ExamModel?>) {
      emit(ResultScreenSuccessStat(getUserHistory: result.data));
    }
    if (result is Fail<ExamModel?>) {
      emit(ResultScreenErrorStat(errorMessage: result.exception));
    }
  }

}
*******************/