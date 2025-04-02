import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/api/home_layout_api_manger.dart';
import 'package:online_exam/feature/home_layout/data/data_source/explore/explore_remote_data_source/explore_remote_data_source_impl.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/request/CheckQuestionsRequesrt.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/check_questions_model/CheckQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/subject_model/Subject_model.dart';

import 'explore_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([HomeLayoutApiManger])
void main(){
  late MockHomeLayoutApiManger mockApiManger;
  late ExploreRemoteDataSourceImpl exploreRemoteDataSource;

  setUp((){
    mockApiManger = MockHomeLayoutApiManger();
    exploreRemoteDataSource = ExploreRemoteDataSourceImpl(apiManger: mockApiManger);
  });

//getAllSubjects
  group("getAllSubjects", () {
    test("should return SubjectModel when API call is successful", () async {
      final subjectModel = SubjectModel();
      when(mockApiManger.getAllSubjects()).thenAnswer((_) async => subjectModel);
      final result = await exploreRemoteDataSource.getAllSubjects();
      expect(result, isA<Success<SubjectModel?>>());
      expect((result as Success<SubjectModel?>).data, subjectModel);
    });
    test("should return Failure when API call fails", () async {
      when(mockApiManger.getAllSubjects()).thenThrow(Exception("API Call Failed"));
      final result = await exploreRemoteDataSource.getAllSubjects();
      expect(result, isA<Fail<SubjectModel?>>());
      expect((result as Fail<SubjectModel?>).exception.toString(), "Exception: API Call Failed");
    });
  });

//getAllExams
  group("getAllExams", () {
    const testSubjectId="1234";
    test("should return GetAllExamsModel when API call is successful", () async {
      final examModel = GetAllExamsModel();
      when(mockApiManger.getAllExams(testSubjectId)).thenAnswer((_) async => examModel);
      final result = await exploreRemoteDataSource.getAllExams(testSubjectId);
      expect(result, isA<Success<GetAllExamsModel?>>());
      expect((result as Success<GetAllExamsModel?>).data, examModel);
    });
    test("should return Failure when API call fails", () async {
      when(mockApiManger.getAllExams(testSubjectId)).thenThrow(Exception("API Call Failed"));
      final result = await exploreRemoteDataSource.getAllExams(testSubjectId);
      expect(result, isA<Fail<GetAllExamsModel?>>());
      expect((result as Fail<GetAllExamsModel?>).exception.toString(), "Exception: API Call Failed");
    });
  });

//getAllQuestions
  group("getAllQuestions", () {
    const testExamId="1234";
    test("should return GetAllQuestionsModel when API call is successful", () async {
      final questionsModel = GetAllQuestionsModel();
      when(mockApiManger.getAllQuestions(testExamId)).thenAnswer((_) async => questionsModel);
      final result = await exploreRemoteDataSource.getAllQuestions(testExamId);
      expect(result, isA<Success<GetAllQuestionsModel?>>());
      expect((result as Success<GetAllQuestionsModel?>).data, questionsModel);
    });
    test("should return Failure when API call fails", () async {
      when(mockApiManger.getAllQuestions(testExamId)).thenThrow(Exception("API Call Failed"));

      final result = await exploreRemoteDataSource.getAllQuestions(testExamId);

      expect(result, isA<Fail<GetAllQuestionsModel?>>());
      expect((result as Fail<GetAllQuestionsModel?>).exception.toString(), "Exception: API Call Failed");
    });
  });

//checkQuestions
  group("checkQuestions", () {
    final testRequest=CheckQuestionsRequest();
    test("should return CheckQuestionsModel when API call is successful", () async {
      final checkQuestionsModel = CheckQuestionsModel();
      when(mockApiManger.checkQuestions(testRequest)).thenAnswer((_) async => checkQuestionsModel);
      final result = await exploreRemoteDataSource.checkQuestions(testRequest);

      expect(result, isA<Success<CheckQuestionsModel?>>());
      expect((result as Success<CheckQuestionsModel?>).data, checkQuestionsModel);
    });
    test("should return Failure when API call fails", () async {
      when(mockApiManger.checkQuestions(testRequest)).thenThrow(Exception("API Call Failed"));

      final result = await exploreRemoteDataSource.checkQuestions(testRequest);

      expect(result, isA<Fail<CheckQuestionsModel?>>());
      expect((result as Fail<CheckQuestionsModel?>).exception.toString(), "Exception: API Call Failed");
    });
  });
}
