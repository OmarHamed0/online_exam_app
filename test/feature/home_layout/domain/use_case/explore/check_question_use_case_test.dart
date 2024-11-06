import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/request/CheckQuestionsRequesrt.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/check_questions_model/CheckQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/explore/check_question_use_case.dart';

import 'explore_repository_mock.mocks.dart';

void main() {
  late CheckQuestionsUseCase useCase;
  late MockExploreRepository mockRepository;

  setUp(() {
    mockRepository = MockExploreRepository();
    useCase = CheckQuestionsUseCase(repository: mockRepository);
  });
  setUpAll(() {
    provideDummy<Result<CheckQuestionsModel?>>(
        Success<CheckQuestionsModel?>(data: null));
  });
  group("GetAllQuestionsUseCase", () {
    final testRequest = CheckQuestionsRequest();
    final testResponse = CheckQuestionsModel();
    test("data has returned when repository call is successful", () async {
      when(mockRepository.checkQuestions(testRequest)).thenAnswer(
          (_) async => Success<CheckQuestionsModel?>(data: testResponse));
      final result = await useCase.invoke(testRequest);
      expect(result, isA<Success<CheckQuestionsModel?>>());
      expect((result as Success).data, equals(testResponse));
    });
    test("data has returned when repository call is fail", () async {
      when(mockRepository.checkQuestions(testRequest)).thenAnswer((_) async =>
          Fail<CheckQuestionsModel?>(
              exception: Exception("Failed to load Questions")));
      final result = await useCase.invoke(testRequest);
      expect(result, isA<Fail<CheckQuestionsModel?>>());
      expect((result as Fail).exception.toString(),
          equals("Exception: Failed to load Questions"));
    });
  });
}
