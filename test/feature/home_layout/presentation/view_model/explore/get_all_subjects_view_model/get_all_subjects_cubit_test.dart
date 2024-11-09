import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/subject_model/Subject_model.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/explore/get_all_subject_use_case.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_subjects_view_model/get_all_subjects_cubit.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_subjects_view_model/get_all_subjects_state.dart';

import 'get_all_subjects_cubit_test.mocks.dart';

@GenerateMocks([GetAllSubjectsUseCase])
void main() {
  late ExploreCubit exploreCubit;
  late MockGetAllSubjectsUseCase mockSubjectsUseCase;

  setUp(() {
    mockSubjectsUseCase = MockGetAllSubjectsUseCase();
    exploreCubit = ExploreCubit(useCase: mockSubjectsUseCase);
  });
  setUpAll(() {
    provideDummy<Result<SubjectModel?>>(Success<SubjectModel?>(data: null));
  });
  tearDown((){
    exploreCubit.close();
  });
  final testData = SubjectModel();
  blocTest(
      "should emit [GetAllSubjectsLoadingState,GetAllSubjectsSuccessState] when data is fetched",
      build: () {
        when(mockSubjectsUseCase.invoke())
            .thenAnswer((_) async => Success<SubjectModel?>(data: testData));
        return exploreCubit;
      },
      act: (exploreCubit) => exploreCubit.getAllSubjects(),
      expect: () => [
            isA<GetAllSubjectsLoadingState>(),
            isA<GetAllSubjectsSuccessState>(),
          ]);
  blocTest(
      "should emit [GetAllSubjectsLoadingState, GetAllSubjectsErrorState] when data failed to fetch",
      build: () {
        when(mockSubjectsUseCase.invoke())
            .thenAnswer((_) async => Fail<SubjectModel?>(exception: Exception("failed to fetch data")));
        return exploreCubit;
      },
      act: (exploreCubit) => exploreCubit.getAllSubjects(),
      expect: () => [
        isA<GetAllSubjectsLoadingState>(),
        isA<GetAllSubjectsErrorState>(),
          ]);
}
