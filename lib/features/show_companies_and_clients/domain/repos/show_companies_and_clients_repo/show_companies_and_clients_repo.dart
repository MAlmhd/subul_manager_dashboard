import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/entities/comanies_and_clients_entity/companies_and_clients_entity.dart';

abstract class ShowCompaniesAndClientsRepo {
  Future<Either<Failure, List<CompaniesAndClientsEntity>>> showCompaniesAndClients();
}
