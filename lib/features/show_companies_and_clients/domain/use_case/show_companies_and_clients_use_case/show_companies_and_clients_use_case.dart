import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/core/use_cases/use_case.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/entities/comanies_and_clients_entity/companies_and_clients_entity.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/repos/show_companies_and_clients_repo/show_companies_and_clients_repo.dart';

class ShowCompaniesAndClientsUseCase
    extends UseCase<List<CompaniesAndClientsEntity>, NoParam> {
  final ShowCompaniesAndClientsRepo showCompaniesAndClientsRepo;

  ShowCompaniesAndClientsUseCase(this.showCompaniesAndClientsRepo);
  
  @override
  Future<Either<Failure, List<CompaniesAndClientsEntity>>> call([NoParam? params]) async{
    return await showCompaniesAndClientsRepo.showCompaniesAndClients();
  }
  
  
}
