import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/core/use_cases/use_case.dart';
import 'package:subul_manager_dashboard/features/register_company/domain/entities/basic_response_for_register_compant.dart';
import 'package:subul_manager_dashboard/features/register_company/domain/repo/register_company_repo.dart';

class RegisterCompanyUseCase
    extends UseCase<RegisterCompanyEntity, RegisterCompanyParams> {
  final RegisterCompanyRepo registerCompanyRepo;

  RegisterCompanyUseCase(this.registerCompanyRepo);
  @override
  Future<Either<Failure, RegisterCompanyEntity>> call([
    RegisterCompanyParams? params,
  ]) async {
    return await registerCompanyRepo.register(
      firstName: params!.firstName,
      email: params.email,
      password: params.password,
      phone: params.phone,
      address: params.address,
      timeZone: params.timeZone,
      prophilePhoto: params.prophilePhoto,
    );
  }
}

class RegisterCompanyParams {
  final String firstName;
  final String email;
  final String password;
  final String phone;
  final String address;
  final String timeZone;
  final XFile prophilePhoto;

  RegisterCompanyParams(
    this.firstName,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.timeZone,
    this.prophilePhoto,
  );
}
