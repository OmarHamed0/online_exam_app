 import 'package:injectable/injectable.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../../../core/api/execute_api_call.dart';
import '../../../api/home_layout_api_manger.dart';
import '../../../mdoel/response/subject_model/Subject_model.dart';
import 'explore_remote_data_source.dart';

@Injectable(as: ExploreRemoteDataSource)
class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource{
HomeLayoutApiManger apiManger;
ExploreRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Result<SubjectModel?>> getAllSubjects()async {
    return executeApiCall<SubjectModel?>(
        apiCall:()async{
          var response=await apiManger.getAllSubjects();
          return response;
        }
    );

}}