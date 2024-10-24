import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/Questions.dart';
import 'package:online_exam/feature/home_layout/domain/entities/Exam.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/explore/get_all_questions_use_case.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_questions_view_model/get_all_questions_state.dart';
@injectable
class GetAllQuestionsCubit extends Cubit<GetAllQuestionsStates>{
  GetAllQuestionsUseCase useCase;
  GetAllQuestionsCubit({required this.useCase}):super(GetAllQuestionsInitialState());
  List<Questions> questionsList = [];

  void getAllQuestions()async{
    emit(GetAllQuestionsLoadingState(loadingMessage: "Loading....."));
    var result=await useCase.invoke();
    if(result is Success<GetAllQuestionsModel?>){
      questionsList=result.data?.questions??[];
      emit(GetAllQuestionsSuccessState(getAllQuestions: result.data));
    }
    if(result is Fail<GetAllQuestionsModel?>){
      emit(GetAllQuestionsErrorState(exception:result.exception));

    }
  }
}