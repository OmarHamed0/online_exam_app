import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/explore/get_all_questions_use_case.dart';

import 'explore_repository_mock.mocks.dart';

void main() {
  late GetAllQuestionsUseCase useCase;
  late MockExploreRepository mockRepository;

  setUpAll(() {
    provideDummy<Result<GetAllQuestionsModel?>>(
        Success<GetAllQuestionsModel?>(data: null));
  });

  setUp(() {
    mockRepository = MockExploreRepository();
    useCase = GetAllQuestionsUseCase(repository: mockRepository);
  });
  group("GetAllQuestionsUseCase", () {
    final testQuestionsData = GetAllQuestionsModel();
    const examId = "1234";
    test("data has returned when repository call is successful ", () async {
      when(mockRepository.getAllQuestions(examId))
          .thenAnswer((_) async => Success(data: testQuestionsData));
      final result = await useCase.invoke(examId);
      expect(result, isA<Success<GetAllQuestionsModel?>>());
      expect((result as Success).data, equals(testQuestionsData));
    });
    test("data has returned when repository call is fail", () async {
      when(mockRepository.getAllQuestions(examId)).thenAnswer(
          (_) async => Fail(exception: Exception("Failed to load Questions")));
      final result = await useCase.invoke(examId);
      expect(result, isA<Fail<GetAllQuestionsModel?>>());
      expect((result as Fail).exception.toString(),
          equals("Exception: Failed to load Questions"));
    });
  });
}
