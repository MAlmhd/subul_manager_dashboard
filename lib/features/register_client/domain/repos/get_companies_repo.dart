import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/entites/company_entity/company_entity.dart';

abstract class GetCompaniesRepo {
  Future<Either<Failure, List<CompanyEntity>>> getCompanies();
}
