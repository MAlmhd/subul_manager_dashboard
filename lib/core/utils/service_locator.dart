import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:subul_manager_dashboard/core/data/auth_local_data_source.dart';
import 'package:subul_manager_dashboard/core/utils/api_service.dart';
import 'package:subul_manager_dashboard/features/register_client/data/data_source/get_companies_data_source/get_companies_local_data_source.dart';
import 'package:subul_manager_dashboard/features/register_client/data/data_source/get_companies_data_source/get_companies_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/register_client/data/data_source/register_client_data_source/register_client_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/register_client/data/repos/get_companies_repo/get_companies_repo_impl.dart';
import 'package:subul_manager_dashboard/features/register_client/data/repos/register_client_repo/register_client_repo_impl.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/repos/get_companies_repo.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/repos/register_client_repo.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/use_cases/get_companies_use_case.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/use_cases/register_client_use_case.dart';
import 'package:subul_manager_dashboard/features/register_company/data/data_source/register_company_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/register_company/data/repos/register_company_repo_impl.dart';
import 'package:subul_manager_dashboard/features/register_company/domain/repo/register_company_repo.dart';
import 'package:subul_manager_dashboard/features/register_company/domain/use_case/register_company_use_case.dart';
import 'package:subul_manager_dashboard/features/sign_in/data/data_sources/sign_in_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/sign_in/data/repos/sign_in_repo_impl.dart';
import 'package:subul_manager_dashboard/features/sign_in/domain/repos/sign_in_repo.dart';
import 'package:subul_manager_dashboard/features/sign_in/domain/use_cases/sign_in_use_case.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  // Core
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<FlutterSecureStorage>(() => FlutterSecureStorage());
  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(storage: sl<FlutterSecureStorage>()),
  );

  // Sign In Feature
  sl.registerLazySingleton<SignInRemoteDataSource>(
    () => SignInRemoteDataSourceImpl(sl<ApiService>()),
  );
  sl.registerLazySingleton<SignInRepo>(
    () => SignInRepoImpl(
      signInRemoteDataSource: sl<SignInRemoteDataSource>(),
      authLocalDataSource: sl<AuthLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(sl<SignInRepo>()),
  );

  // get companies

  sl.registerLazySingleton<GetCompaniesRemoteDataSource>(
    () => GetCompaniesRemoteDataSourceImpl(sl.get<ApiService>()),
  );

  sl.registerLazySingleton<GetCompaniesLocalDataSource>(
    () => GetCompaniesLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<GetCompaniesRepo>(
    () => GetCompaniesRepoImpl(
      getCompaniesLocalDataSource: sl.get<GetCompaniesLocalDataSource>(),
      getCompaniesRemoteDataSource: sl.get<GetCompaniesRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<GetCompaniesUseCase>(
    () => GetCompaniesUseCase(sl.get<GetCompaniesRepo>()),
  );

  // register client
  sl.registerLazySingleton<RegisterClientRemoteDataSource>(
    () => RegisterClientRemoteDataSourceImpl(sl.get<ApiService>()),
  );

  sl.registerLazySingleton<RegisterClientRepo>(
    () => RegisterClientRepoImpl(sl.get<RegisterClientRemoteDataSource>()),
  );

  sl.registerLazySingleton<RegisterClientUseCase>(
    () => RegisterClientUseCase(sl.get<RegisterClientRepo>())
  );
  // register company
   sl.registerLazySingleton<RegisterCompanyRemoteDataSource>(
    () => RegisterCompanyRemoteDataSourceImpl(sl.get<ApiService>()),
  );

  sl.registerLazySingleton<RegisterCompanyRepo>(
    () => RegisterCompanyRepoImpl(sl.get<RegisterCompanyRemoteDataSource>()),
  );

  sl.registerLazySingleton<RegisterCompanyUseCase>(
    () => RegisterCompanyUseCase(sl.get<RegisterCompanyRepo>())
  );
}
