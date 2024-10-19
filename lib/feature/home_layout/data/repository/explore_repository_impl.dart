import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/home_layout/data/data_source/explore/explore_offline_data_source/explore_offline_data_source.dart';
import 'package:online_exam/feature/home_layout/data/data_source/explore/explore_remote_data_source/explore_remote_data_source.dart';
import 'package:online_exam/feature/home_layout/data/data_source/explore/explore_remote_data_source/explore_remote_data_source_impl.dart';
import 'package:online_exam/feature/home_layout/domain/repository/explore_repository.dart';

import '../../../../core/api/api_result.dart';
import '../../domain/entities/app_user_entity.dart';
import '../../domain/repository/profile_repository.dart';
import '../data_source/profile/profile_remote_data_source/profile_remote_data_source.dart';
@Injectable(as: ExploreRepository)
class ExploreRepositoryImpl implements ExploreRepository{
 final ExploreRemoteDataSource exploreRemoteDataSource;
 final ExploreOfflineDataSource exploreOfflineDataSource;
  ExploreRepositoryImpl({required this.exploreRemoteDataSource, required this.exploreOfflineDataSource});
}