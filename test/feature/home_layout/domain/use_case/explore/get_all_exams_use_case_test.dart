import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/explore/get_all_exams_use_case.dart';

import 'explore_repository_mock.mocks.dart';

void main() {
  late GetAllExamsUseCase useCase;
  late MockExploreRepository mockRepository;

  setUpAll(() {
    provideDummy<Result<GetAllExamsModel?>>(
        Success<GetAllExamsModel?>(data: null));
  });

  setUp(() {
    mockRepository = MockExploreRepository();
    useCase = GetAllExamsUseCase(repository: mockRepository);
  });

  group("GetAllExamsUseCase", () {
    final testExamModel = GetAllExamsModel();
    const subjectId = "123";

    test("data has returned when repository call is successful", () async {
      when(mockRepository.getAllExams(subjectId)).thenAnswer(
          (_) async => Success<GetAllExamsModel?>(data: testExamModel));
      final result = await useCase.invoke(subjectId);
      expect(result, isA<Success<GetAllExamsModel?>>());
      expect((result as Success).data, equals(testExamModel));
    });

    test("data has returned when repository call is Fail", () async {
      when(mockRepository.getAllExams(subjectId)).thenAnswer((_) async =>
          Fail<GetAllExamsModel?>(
              exception: Exception("Failed to load exams")));
      final result = await useCase.invoke(subjectId);
      expect(result, isA<Fail<GetAllExamsModel?>>());
      expect((result as Fail).exception.toString(),
          equals("Exception: Failed to load exams"));
    });
  });
}
