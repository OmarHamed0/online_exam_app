import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/Questions.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/explore/get_all_questions_use_case.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_questions_view_model/get_all_questions_cubite.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_questions_view_model/get_all_questions_state.dart';
import 'get_all_questions_cubit_test.mocks.dart';


@GenerateMocks([GetAllQuestionsUseCase])
void main() {
  late GetAllQuestionsCubit getAllQuestionsCubit;
  late MockGetAllQuestionsUseCase mockGetAllQuestionsUseCase;

  setUp(() {
    mockGetAllQuestionsUseCase = MockGetAllQuestionsUseCase();
    getAllQuestionsCubit =
        GetAllQuestionsCubit(useCase: mockGetAllQuestionsUseCase);
  });
  setUpAll(() {
    provideDummy<Result<GetAllQuestionsModel?>>(
        Success<GetAllQuestionsModel?>(data: null));
  });
  tearDown(() {
    getAllQuestionsCubit.close();
  });

  const testExamId = "1234";
  const testDuration = 20;
  final testQuestions = [Questions()];
  final testData = GetAllQuestionsModel(questions: testQuestions);
  final testException = Exception("Failed to fetch data");

  blocTest<GetAllQuestionsCubit, GetAllQuestionsStates>(
      "should emit [GetAllQuestionsLoadingState, GetAllQuestionsSuccessState] when data is fetched successfully",
      build: () {
        when(mockGetAllQuestionsUseCase.invoke(testExamId)).thenAnswer(
            (_) async => Success<GetAllQuestionsModel?>(data: testData));
        return getAllQuestionsCubit;
      },
      act: (getAllQuestionsCubit) =>
          getAllQuestionsCubit.getAllQuestions(testExamId, testDuration),
      expect: () => [
            isA<GetAllQuestionsLoadingState>(),
            isA<GetAllQuestionsSuccessState>(),
          ]);
  blocTest<GetAllQuestionsCubit, GetAllQuestionsStates>(
      "should emit GetAllQuestionsErrorState when fetching data fails",
      build: () {
        when(mockGetAllQuestionsUseCase.invoke(testExamId)).thenAnswer(
            (_) async => Fail<GetAllQuestionsModel?>(
                exception: Exception(testException)));
        return getAllQuestionsCubit;
      },
      act: (getAllQuestionsCubit) =>
          getAllQuestionsCubit.getAllQuestions(testExamId, testDuration),
      expect: () => [
            isA<GetAllQuestionsLoadingState>(),
            isA<GetAllQuestionsErrorState>(),
          ]);
  blocTest<GetAllQuestionsCubit, GetAllQuestionsStates>(
      "should emit GetAllQuestionsEmptyState when no questions are fetched",
      build: () {
        when(mockGetAllQuestionsUseCase.invoke(testExamId)).thenAnswer(
            (_) async => Success<GetAllQuestionsModel?>(data: GetAllQuestionsModel(questions: [])));
        return getAllQuestionsCubit;
      },
      act: (getAllQuestionsCubit) =>
          getAllQuestionsCubit.getAllQuestions(testExamId, testDuration),
      expect: () => [
            isA<GetAllQuestionsLoadingState>(),
            isA<GetAllQuestionsEmptyState>(),
          ]);
  blocTest<GetAllQuestionsCubit, GetAllQuestionsStates>(
      "should emit GetAllQuestionsTimeOutState when the timer runs out",
      build: () {
        when(mockGetAllQuestionsUseCase.invoke(testExamId)).thenAnswer(
            (_) async => Success<GetAllQuestionsModel?>(data:testData));
        return getAllQuestionsCubit;
      },
      act: (getAllQuestionsCubit) async {
         getAllQuestionsCubit.getAllQuestions(testExamId, testDuration);
        await Future.delayed(const Duration(milliseconds: 100));
        getAllQuestionsCubit.remainingTime = 0;
        getAllQuestionsCubit.timer?.cancel();
        getAllQuestionsCubit.emit(GetAllQuestionsTimeOutState());
      },
      expect: () => [
            isA<GetAllQuestionsLoadingState>(),
            isA<GetAllQuestionsSuccessState>(),
            isA<GetAllQuestionsTimeOutState>(),
          ]);

blocTest<GetAllQuestionsCubit, GetAllQuestionsStates>(
      "should navigate to the next question when nextQuestion is called",
      build: () {
        when(mockGetAllQuestionsUseCase.invoke(testExamId)).thenAnswer(
            (_) async => Success<GetAllQuestionsModel?>(data:testData));
        return getAllQuestionsCubit;
      },
      act: (getAllQuestionsCubit) {
          getAllQuestionsCubit.getAllQuestions(testExamId, testDuration);
          getAllQuestionsCubit.nextQuestion();
      },
    expect: () => [
      isA<GetAllQuestionsLoadingState>(),
      isA<GetAllQuestionsSuccessState>(),

    ]);
  blocTest<GetAllQuestionsCubit, GetAllQuestionsStates>(
      "should navigate to the previous question when previousQuestion is called",
      build: () {
        when(mockGetAllQuestionsUseCase.invoke(testExamId)).thenAnswer(
            (_) async => Success<GetAllQuestionsModel?>(data:testData));
        return getAllQuestionsCubit;
      },
      act: (getAllQuestionsCubit) {
          getAllQuestionsCubit.currentQuestionIndex=1;
          getAllQuestionsCubit.previousQuestion();
      },
    expect: () => [
      GetAllQuestionsPreviousQuestionState(currentQuestionIndex: 0),

    ]);
}
