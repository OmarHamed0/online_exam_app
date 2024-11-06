import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base/base_view_model.dart';
import '../../../../../../core/api/api_result.dart';
import '../../../../data/mdoel/response/subject_model/Subject_model.dart';
import '../../../../data/mdoel/response/subject_model/subjects.dart';
import '../../../../domain/use_case/explore/get_all_subject_use_case.dart';
import 'get_all_subjects_state.dart';

@injectable
class ExploreCubit extends BaseViewModel<GetAllSubjectsStates> {
  GetAllSubjectsUseCase useCase;
  ExploreCubit({required this.useCase}) : super(GetAllSubjectsInitialState());
  List<Subjects> subjectList = [];

  void getAllSubjects() async {
    emit(GetAllSubjectsLoadingState(loadingMessage: "loading..."));
    var result = await useCase.invoke();
    if (result is Success<SubjectModel?>) {
      subjectList = result.data?.subjects ?? [];
      emit(GetAllSubjectsSuccessState(getAllSubjects: result.data));
    } else if (result is Fail<SubjectModel?>) {
      emit(GetAllSubjectsErrorState(errorMessage: getErrorMassageFromException(result.exception)));
    }
  }
}