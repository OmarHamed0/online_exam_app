import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/explore/get_all_exams_use_case.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_exams_view_model/get_all_exams_cubit.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_exams_view_model/get_all_exams_state.dart';
import 'get_all_exams_cubit_test.mocks.dart';

@GenerateMocks([GetAllExamsUseCase])
void main() {
  late GetAllExamsCubit getAllExamsCubit;
  late MockGetAllExamsUseCase mockGetAllExamsUseCase;

  setUp(() {
    mockGetAllExamsUseCase = MockGetAllExamsUseCase();
    getAllExamsCubit = GetAllExamsCubit(useCase: mockGetAllExamsUseCase);
  });
  setUpAll(() {
    provideDummy<Result<GetAllExamsModel?>>(
        Success<GetAllExamsModel?>(data: null));
  });
  tearDown(() {
    getAllExamsCubit.close();
  });

  const testSubjectId = "1234";
  final testData = GetAllExamsModel();
  final testException = Exception("Failed to fetch data");

  blocTest<GetAllExamsCubit, GetAllExamsStates>(
      "should emit [GetAllExamsLoadingStat,GetAllExamsSuccessStat] when data is fetched successfully ",
      build: () {
        when(mockGetAllExamsUseCase.invoke(testSubjectId)).thenAnswer(
            (_) async => Success<GetAllExamsModel?>(data: testData));
        return getAllExamsCubit;
      },
      act: (getAllExamsCubit) => getAllExamsCubit.getAllExams(testSubjectId),
      expect: () => [
            isA<GetAllExamsLoadingStat>(),
            isA<GetAllExamsSuccessStat>(),
          ]);
  blocTest<GetAllExamsCubit, GetAllExamsStates>(
      "should emit [GetAllExamsLoadingStat, GetAllExamsErrorStat] when fetching data fails ",
      build: () {
        when(mockGetAllExamsUseCase.invoke(testSubjectId)).thenAnswer(
            (_) async =>
                Fail<GetAllExamsModel?>(exception: Exception(testException)));
        return getAllExamsCubit;
      },
      act: (getAllExamsCubit) => getAllExamsCubit.getAllExams(testSubjectId),
      expect: () => [
            isA<GetAllExamsLoadingStat>(),
            isA<GetAllExamsErrorStat>(),
          ]);
}
