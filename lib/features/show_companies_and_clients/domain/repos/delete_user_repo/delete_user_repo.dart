import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/entities/delete_user_entity/delete_user_entity.dart';

abstract class DeleteUserRepo {
  Future<Either<Failure, DeleteUserEntity>> delete({required int id});
}
