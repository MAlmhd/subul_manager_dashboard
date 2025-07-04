import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/data/data_source/show_companies_and_clients_data_source/show_companies_and_clients_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/entities/comanies_and_clients_entity/companies_and_clients_entity.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/repos/show_companies_and_clients_repo/show_companies_and_clients_repo.dart';

class ShowCompaniesAndClientsRepoImpl implements ShowCompaniesAndClientsRepo {
  final ShowCompaniesAndClientsRemoteDataSource
  showCompaniesAndClientsRemoteDataSource;
  // final ShowCompaniesAndClientsLocalDataSource
  // showCompaniesAndClientsLocalDataSource;

  ShowCompaniesAndClientsRepoImpl(this.showCompaniesAndClientsRemoteDataSource);
  @override
  Future<Either<Failure, List<CompaniesAndClientsEntity>>>
  showCompaniesAndClients() async{
   try {
      List<CompaniesAndClientsEntity> companiesAndClients;
      // companiesAndClients = showCompaniesAndClientsLocalDataSource.showCompaniesAndClients();
      
      // if (companiesAndClients.isNotEmpty) {
      //   return right(companiesAndClients);
      // }                            
      

      companiesAndClients = await showCompaniesAndClientsRemoteDataSource.showCompaniesAndClients();
      
      return right(companiesAndClients);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
