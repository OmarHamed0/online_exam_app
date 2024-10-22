import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/Exams.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/explore/get_all_exams_use_case.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_exams_view_model/get_all_exams_state.dart';

@injectable
class GetAllExamsCubit extends Cubit<GetAllExamsStates> {
  GetAllExamsUseCase useCase;
  GetAllExamsCubit({required this.useCase}) : super(GetAllExamsInitialStat());
  List<Exams> examsList = [];
  void getAllExams() async {
    emit(GetAllExamsLoadingStat(loadingMessage: "Loading...."));
    var result = await useCase.invoke();
    if (result is Success<GetAllExamsModel?>) {
      examsList = result.data?.exams ?? [];
      emit(GetAllExamsSuccessStat(getAllExamsModel: result.data));
    }
    if (result is Fail<GetAllExamsModel?>) {
      emit(GetAllExamsErrorStat(errorMessage: result.exception));
    }
  }
}
