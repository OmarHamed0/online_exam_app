import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/subject_model/Subject_model.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/explore/get_all_subject_use_case.dart';

import 'explore_repository_mock.mocks.dart';

void main() {
  late GetAllSubjectsUseCase useCase;
  late MockExploreRepository mockRepository;

  setUp(() {
    mockRepository = MockExploreRepository();
    useCase = GetAllSubjectsUseCase(repository: mockRepository);
  });

  group("GetAllSubjectsUseCase", () {
    final testSubjectModel = SubjectModel();
    test("data has returned when repository call is successful", () async {
      when(mockRepository.getAllSubjects())
          .thenAnswer((_) async => Success(data: testSubjectModel));
      final result = await useCase.invoke();

      expect(result, isA<Success<SubjectModel?>>());
      expect((result as Success).data, equals(testSubjectModel));
    });

    test("data has returned when repository call is fail", () async {
      when(mockRepository.getAllSubjects()).thenAnswer(
          (_) async => Fail(exception: Exception("Failed to load subjects")));
      final result = await useCase.invoke();

      expect(result, isA<Fail<SubjectModel?>>());

      expect((result as Fail<SubjectModel?>).exception?.toString(),
          equals("Exception: Failed to load subjects"));
    });
  });
}
