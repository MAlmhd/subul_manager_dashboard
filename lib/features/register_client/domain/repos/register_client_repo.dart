import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/entites/basic_response_entity/basic_response_entity.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

abstract class RegisterClientRepo {
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
  });
}
