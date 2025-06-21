import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/core/use_cases/use_case.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/entites/company_entity/company_entity.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/repos/get_companies_repo.dart';

class GetCompaniesUseCase extends UseCase<List<CompanyEntity>, NoParam> {
  final GetCompaniesRepo getCompaniesRepo;

  GetCompaniesUseCase(this.getCompaniesRepo);

  @override
  Future<Either<Failure, List<CompanyEntity>>> call([NoParam? params]) async {
    return await getCompaniesRepo.getCompanies();
  }
}
