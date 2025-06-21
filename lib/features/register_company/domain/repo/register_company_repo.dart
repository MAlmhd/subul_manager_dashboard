import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/register_company/domain/entities/basic_response_for_register_compant.dart';

abstract class RegisterCompanyRepo {
  Future<Either<Failure, RegisterCompanyEntity>> register({
    required String firstName,
    required String email,
    required String password,
    required String phone,
    required String address,
    required String timeZone,
    required XFile prophilePhoto,
  });
}
