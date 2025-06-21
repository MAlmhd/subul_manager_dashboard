// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';

import 'package:subul_manager_dashboard/core/use_cases/use_case.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/entites/basic_response_entity/basic_response_entity.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/repos/register_client_repo.dart';

class RegisterClientUseCase
    extends UseCase<RegisterClientEntity, RegisterClientParams> {
  final RegisterClientRepo registerClientRepo;

  RegisterClientUseCase(this.registerClientRepo);
  @override
  Future<Either<Failure, RegisterClientEntity>> call([
    RegisterClientParams? params,
  ]) async {
    return await registerClientRepo.register(
      firstName: params!.firstName,
      lastName: params.lastName,
      email: params.email,
      password: params.password,
      phone: params.phone,
      gender: params.gender,
      address: params.address,
      timeZone: params.timeZone,
      prophilePhoto: params.prophilePhoto,
      identityPhoto: params.identityPhoto,
      idCompany: params.idCompany,
    );
  }
}

class RegisterClientParams {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String gender;
  final String address;
  final String timeZone;
  final XFile prophilePhoto;
  final XFile identityPhoto;
  final int idCompany;
  RegisterClientParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.gender,
    required this.address,
    required this.timeZone,
    required this.prophilePhoto,
    required this.identityPhoto,
    required this.idCompany,
  });
}
