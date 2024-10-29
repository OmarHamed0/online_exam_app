import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/Questions.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/explore/get_all_questions_use_case.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_questions_view_model/get_all_questions_state.dart';
import '../../../../data/mdoel/request/CheckQuestionsRequesrt.dart';

@injectable
class GetAllQuestionsCubit extends Cubit<GetAllQuestionsStates> {
  GetAllQuestionsUseCase useCase;
  List<CheckQuestionAnswer> cheekQuestionAnswer = [];
  List<Questions> questionList = [];
  List<int?> selectedOptions = [];
  int currentQuestionIndex = 0;
  late int remainingTime;
  Timer? timer;

  GetAllQuestionsCubit({required this.useCase})
      : super(GetAllQuestionsInitialState());

  void getAllQuestions(String examId, int duration) async {
    emit(GetAllQuestionsLoadingState());
    var result = await useCase.invoke(examId);
    if (result is Success<GetAllQuestionsModel?>) {
      questionList = result.data?.questions ?? [];
      selectedOptions = List.filled(questionList.length, null);
      startTimer(duration);

      emit(GetAllQuestionsSuccessState(getAllQuestions: result.data));
    } else if (result is Fail<GetAllQuestionsModel?>) {
      emit(GetAllQuestionsErrorState(errorMassage: result.exception));
    }
  }

  void startTimer(int duration) {
    remainingTime = duration * 60;
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (remainingTime > 0) {
        remainingTime--;
        emit(GetAllQuestionsSuccessState(getAllQuestions: null));
      } else {
        stopTimer();
        emit(GetAllQuestionsTimeOutState());
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  void selectOption(int questionIndex, int optionIndex, String correctKey) {
    if (selectedOptions[questionIndex] != optionIndex) {
      selectedOptions[questionIndex] = optionIndex;
      bool alreadyExists = cheekQuestionAnswer.any((answer) =>
      answer.questionId == questionList[questionIndex].id);

      if (!alreadyExists) {
        cheekQuestionAnswer.add(CheckQuestionAnswer(
            questionId: questionList[questionIndex].id, correct: correctKey));
      }
      emit(GetAllQuestionsSuccessState(getAllQuestions: null));
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < questionList.length - 1) {
      currentQuestionIndex++;
      emit(GetAllQuestionsSuccessState(getAllQuestions: null));
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      currentQuestionIndex--;
      emit(GetAllQuestionsPreviousQuestionState(
          currentQuestionIndex: currentQuestionIndex));
    }
  }
}
