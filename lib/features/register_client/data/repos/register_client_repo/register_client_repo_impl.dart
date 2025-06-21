import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/register_client/data/data_source/register_client_data_source/register_client_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/entites/basic_response_entity/basic_response_entity.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/repos/register_client_repo.dart';

class RegisterClientRepoImpl implements RegisterClientRepo {
  final RegisterClientRemoteDataSource registerClientRemoteDataSource;

  RegisterClientRepoImpl(this.registerClientRemoteDataSource);

  @override
  Future<Either<Failure, RegisterClientEntity>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required String address,
    required String timeZone,
    required XFile prophilePhoto,
    required XFile identityPhoto,
    required int idCompany,
  }) async {
    try {
      RegisterClientEntity registerClientEntity =
          await registerClientRemoteDataSource.registerClient(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            phone: phone,
            gender: gender,
            address: address,
            timeZone: timeZone,
            profilePhoto: prophilePhoto,
            identityPhoto: identityPhoto,
            idCompany: idCompany,
          );
      return right(registerClientEntity);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
