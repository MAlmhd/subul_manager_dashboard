

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/register_client/data/data_source/get_companies_data_source/get_companies_local_data_source.dart';
import 'package:subul_manager_dashboard/features/register_client/data/data_source/get_companies_data_source/get_companies_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/entites/company_entity/company_entity.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/repos/get_companies_repo.dart';

class GetCompaniesRepoImpl implements GetCompaniesRepo {
  final GetCompaniesLocalDataSource getCompaniesLocalDataSource;
  final GetCompaniesRemoteDataSource getCompaniesRemoteDataSource;

  GetCompaniesRepoImpl({
    required this.getCompaniesLocalDataSource,
    required this.getCompaniesRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<CompanyEntity>>> getCompanies() async {
    try {
      List<CompanyEntity> companies;
      companies = getCompaniesLocalDataSource.fetchCompanies();
      
      if (companies.isNotEmpty) {
        return right(companies);
      }                            
      

      companies = await getCompaniesRemoteDataSource.fetchCompanies();
      
      return right(companies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
