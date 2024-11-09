import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/data_source/explore/explore_offline_data_source/explore_offline_data_source.dart';
import 'package:online_exam/feature/home_layout/data/data_source/explore/explore_remote_data_source/explore_remote_data_source.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/request/CheckQuestionsRequesrt.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/check_questions_model/CheckQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/subject_model/Subject_model.dart';
import 'package:online_exam/feature/home_layout/data/repository/explore_repository_impl.dart';
import 'explore_repository_impl_test.mocks.dart';

@GenerateMocks([ExploreRemoteDataSource, ExploreOfflineDataSource])
void main() {
  late ExploreRepositoryImpl exploreRepositoryImpl;
  late MockExploreRemoteDataSource mockExploreRemoteDataSource;
  late MockExploreOfflineDataSource mockExploreOfflineDataSource;

  setUp(() {
    mockExploreRemoteDataSource = MockExploreRemoteDataSource();
    mockExploreOfflineDataSource = MockExploreOfflineDataSource();
    exploreRepositoryImpl = ExploreRepositoryImpl(
      exploreRemoteDataSource: mockExploreRemoteDataSource,
      exploreOfflineDataSource: mockExploreOfflineDataSource,
    );
  });
  setUpAll((){
    provideDummy<Result<GetAllExamsModel?>>(Success<GetAllExamsModel?>(data: null));
    provideDummy<Result<GetAllQuestionsModel?>>(Success<GetAllQuestionsModel?>(data: null));
    provideDummy<Result<CheckQuestionsModel?>>(Success<CheckQuestionsModel?>(data: null));
    provideDummy<Result<SubjectModel?>>(Success<SubjectModel?>(data: null));
  });

  // getAllSubjects
  group("ExploreRepositoryImpl - getAllSubjects", () {
    final testSubjectModel = SubjectModel();
    test("should return Success when getAllSubjects is successful", () async {
      when(mockExploreRemoteDataSource.getAllSubjects()).thenAnswer(
          (_) async => Success<SubjectModel?>(data: testSubjectModel));
      final result = await exploreRepositoryImpl.getAllSubjects();

      expect(result, isA<Success<SubjectModel?>>());
      expect((result as Success).data, equals(testSubjectModel));
    });
    test("should return Fail when getAllSubjects fails", () async {
      when(mockExploreRemoteDataSource.getAllSubjects()).thenAnswer((_) async =>
          Fail<SubjectModel?>(
              exception: Exception("Failed to fetch subjects")));

      final result = await exploreRepositoryImpl.getAllSubjects();

      expect(result, isA<Fail<SubjectModel?>>());
      expect((result as Fail).exception.toString(),
          equals("Exception: Failed to fetch subjects"));
    });
  });

  // getAllExams
  group("ExploreRepositoryImpl - getAllExams", () {
    const String subjectId = "12345";
    final testGetAllExamsModel = GetAllExamsModel();
    test("should returns success when getAllExams is successful", () async {
      when(mockExploreRemoteDataSource.getAllExams(subjectId))
          .thenAnswer((_) async => Success<GetAllExamsModel?>(data: testGetAllExamsModel));
      final result= await mockExploreRemoteDataSource.getAllExams(subjectId);
      expect(result, isA<Success<GetAllExamsModel?>>());
      expect((result as Success).data, equals(testGetAllExamsModel));
    });
    test("should returns fail when getAllExams is fails", () async {
      when(mockExploreRemoteDataSource.getAllExams(subjectId))
          .thenAnswer((_) async => Fail(exception: Exception("failed load exams")));
      final result= await mockExploreRemoteDataSource.getAllExams(subjectId);
      expect(result, isA<Fail<GetAllExamsModel?>>());
      expect((result as Fail).exception.toString(), equals("Exception: failed load exams"));
    });
  });

  // getAllQuestions
  group("ExploreRepositoryImpl - getAllQuestions", () {
    const String examId = "12345";
    final testQuestionsModel = GetAllQuestionsModel();
    test("should returns success when getAllQuestions is successful", () async {
      when(mockExploreRemoteDataSource.getAllQuestions(examId))
          .thenAnswer((_) async => Success<GetAllQuestionsModel?>(data:testQuestionsModel ));
      final result= await mockExploreRemoteDataSource.getAllQuestions(examId);
      expect(result, isA<Success<GetAllQuestionsModel?>>());
      expect((result as Success).data, equals(testQuestionsModel));
    });
    test("should returns fail when getAllQuestions is fails", () async {
      when(mockExploreRemoteDataSource.getAllQuestions(examId))
          .thenAnswer((_) async => Fail<GetAllQuestionsModel?>(exception: Exception("failed load questions")));
      final result= await mockExploreRemoteDataSource.getAllQuestions(examId);
      expect(result, isA<Fail<GetAllQuestionsModel?>>());
      expect((result as Fail).exception.toString(), equals("Exception: failed load questions"));
    });
  });


  // checkQuestions
  group("ExploreRepositoryImpl - checkQuestions", () {
    final testRequest = CheckQuestionsRequest();
    final testResponse = CheckQuestionsModel();
    test("should returns success when checkQuestions is successful", () async {
      when(mockExploreRemoteDataSource.checkQuestions(testRequest))
          .thenAnswer((_) async => Success<CheckQuestionsModel?>(data:testResponse ));
      final result= await mockExploreRemoteDataSource.checkQuestions(testRequest);
      expect(result, isA<Success<CheckQuestionsModel?>>());
      expect((result as Success).data, equals(testResponse));
    });
    test("should returns fail when checkQuestions is fails", () async {
      when(mockExploreRemoteDataSource.checkQuestions(testRequest))
          .thenAnswer((_) async => Fail<CheckQuestionsModel?>(exception: Exception("failed checkQuestions")));
      final result= await mockExploreRemoteDataSource.checkQuestions(testRequest);
      expect(result, isA<Fail<CheckQuestionsModel?>>());
      expect((result as Fail).exception.toString(), equals("Exception: failed checkQuestions"));
    });
  });

}
