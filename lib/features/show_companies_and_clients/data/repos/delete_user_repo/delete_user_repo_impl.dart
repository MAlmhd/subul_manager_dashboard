import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/data/data_source/delete_user_data_source/delete_user_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/entities/delete_user_entity/delete_user_entity.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/repos/delete_user_repo/delete_user_repo.dart';

class DeleteUserRepoImpl implements DeleteUserRepo {
  final DeleteUserRemoteDataSource deleteUserRemoteDataSource;

  DeleteUserRepoImpl(this.deleteUserRemoteDataSource);
  @override
  Future<Either<Failure, DeleteUserEntity>> delete({required int id}) async {
    try {
      DeleteUserEntity deleteUserEntity = await deleteUserRemoteDataSource
          .deleteUser(id: id);
      return right(deleteUserEntity);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
