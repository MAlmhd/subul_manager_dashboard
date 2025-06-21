import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/register_company/data/data_source/register_company_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/register_company/domain/entities/basic_response_for_register_compant.dart';
import 'package:subul_manager_dashboard/features/register_company/domain/repo/register_company_repo.dart';

class RegisterCompanyRepoImpl implements RegisterCompanyRepo {
  final RegisterCompanyRemoteDataSource registerCompanyRemoteDataSource;

  RegisterCompanyRepoImpl(this.registerCompanyRemoteDataSource);
  @override
  Future<Either<Failure, RegisterCompanyEntity>> register({
    required String firstName,
    required String email,
    required String password,
    required String phone,
    required String address,
    required String timeZone,
    required XFile prophilePhoto,
  }) async {
    try {
      RegisterCompanyEntity registerCompanyEntity =
          await registerCompanyRemoteDataSource.registerCompany(
            firstName: firstName,
            email: email,
            password: password,
            phone: phone,
            address: address,
            timeZone: timeZone,
            prophilePhoto: prophilePhoto,
          );
      return right(registerCompanyEntity);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
