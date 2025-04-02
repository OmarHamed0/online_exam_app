import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/request/CheckQuestionsRequesrt.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/check_questions_model/CheckQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/explore/check_question_use_case.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/check_questions_view_model/check_questions_cubit.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/check_questions_view_model/check_questions_states.dart';
import 'check_questions_cubit_test.mocks.dart';

@GenerateMocks([CheckQuestionsUseCase])
void main() {
  late CheckQuestionsCubit checkQuestionsCubit;
  late MockCheckQuestionsUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockCheckQuestionsUseCase();
    checkQuestionsCubit = CheckQuestionsCubit(useCase: mockUseCase);
  });
  setUpAll(() {
    provideDummy<Result<CheckQuestionsModel?>>(
        Success<CheckQuestionsModel?>(data: null));
  });
  tearDown(() {
    checkQuestionsCubit.close();
  });

  final testRequest = CheckQuestionsRequest();
  final testData = CheckQuestionsModel();
  blocTest<CheckQuestionsCubit, CheckQuestionsStates>(
    'should emit [CheckQuestionsLoadingStat, CheckQuestionsSuccessStat] when data is fetched successfully',
    build: () {
      when(mockUseCase.invoke(testRequest)).thenAnswer(
          (_) async => Success<CheckQuestionsModel>(data: testData));
      return checkQuestionsCubit;
    },
    act: (checkQuestionsCubit) =>
        checkQuestionsCubit.checkQuestions(testRequest),
    expect: () => [
      isA<CheckQuestionsLoadingStat>(),
      isA<CheckQuestionsSuccessStat>(),
    ],
  );
  blocTest<CheckQuestionsCubit, CheckQuestionsStates>(
    'should emit [CheckQuestionsLoadingStat, CheckQuestionsErrorStat] when fetching data fails',
    build: () {
      when(mockUseCase.invoke(testRequest)).thenAnswer(
          (_) async => Fail<CheckQuestionsModel>(exception: Exception("failed to fetch data")));
      return checkQuestionsCubit;
    },
    act: (checkQuestionsCubit) =>
        checkQuestionsCubit.checkQuestions(testRequest),
    expect: () => [
      isA<CheckQuestionsLoadingStat>(),
      isA<CheckQuestionsErrorStat>(),
    ],
  );
}
