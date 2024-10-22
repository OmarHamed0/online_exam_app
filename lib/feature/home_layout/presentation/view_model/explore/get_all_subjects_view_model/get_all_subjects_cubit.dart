import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_result.dart';
import '../../../../data/mdoel/response/subject_model/Subject_model.dart';
import '../../../../data/mdoel/response/subject_model/subjects.dart';
import '../../../../domain/use_case/explore/get_all_subject_use_case.dart';
import 'get_all_subjects_state.dart';

@injectable
class ExploreCubit extends Cubit<GetAllSubjectsStates> {
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
      emit(GetAllSubjectsErrorState(errorMessage: result.exception));
    }
  }
}