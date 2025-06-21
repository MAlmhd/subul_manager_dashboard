import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:subul_manager_dashboard/core/data/auth_local_data_source.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/sign_in/data/data_sources/sign_in_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/sign_in/domain/entites/sign_in_entity.dart';
import 'package:subul_manager_dashboard/features/sign_in/domain/repos/sign_in_repo.dart';

class SignInRepoImpl implements SignInRepo {
  final SignInRemoteDataSource signInRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  SignInRepoImpl({
    required this.signInRemoteDataSource,
    required this.authLocalDataSource,
  });
  @override
  Future<Either<Failure, SignInEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final signInEntity = await signInRemoteDataSource.signIn(
        email: email,
        password: password,
      );
      await authLocalDataSource.saveToken(signInEntity.token);

      
      return right(signInEntity);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
