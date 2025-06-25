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
import 'package:subul_manager_dashboard/features/show_companies_and_clients/data/data_source/delete_user_data_source/delete_user_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/data/data_source/show_companies_and_clients_data_source/show_companies_and_clients_local_data_source.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/data/data_source/show_companies_and_clients_data_source/show_companies_and_clients_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/data/repos/delete_user_repo/delete_user_repo_impl.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/data/repos/show_companies_and_clients_repo/show_companies_and_clients_repo_impl.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/repos/delete_user_repo/delete_user_repo.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/repos/show_companies_and_clients_repo/show_companies_and_clients_repo.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/use_case/delete_user_use_case/delete_user_use_case.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/use_case/show_companies_and_clients_use_case/show_companies_and_clients_use_case.dart';
import 'package:subul_manager_dashboard/features/sign_in/data/data_sources/sign_in_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/sign_in/data/repos/sign_in_repo_impl.dart';
import 'package:subul_manager_dashboard/features/sign_in/domain/repos/sign_in_repo.dart';
import 'package:subul_manager_dashboard/features/sign_in/domain/use_cases/sign_in_use_case.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/data/data_source/get_approved_shipments_data_source/get_approved_shipments_local_data_source.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/data/data_source/get_approved_shipments_data_source/get_approved_shipments_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/data/repo/get_approved_shipments_repo/get_approved_shipments_repo_impl.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/repos/get_approved_shipments_repo/get_approved_shipments_repo.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/use_case/get_approved_shipments_use_case/get_approved_shipments_use_case.dart';

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

  // show companies and clients
  
  sl.registerLazySingleton<ShowCompaniesAndClientsRemoteDataSource>(
    () => ShowCompaniesAndClientsRemoteDataSourceImpl(sl.get<ApiService>()),
  );

  sl.registerLazySingleton<ShowCompaniesAndClientsLocalDataSource>(
    () => ShowCompaniesAndClientsLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<ShowCompaniesAndClientsRepo>(
    () => ShowCompaniesAndClientsRepoImpl(
     sl.get<ShowCompaniesAndClientsRemoteDataSource>(),
     sl.get<ShowCompaniesAndClientsLocalDataSource>()
    ),
  );

  sl.registerLazySingleton<ShowCompaniesAndClientsUseCase>(
    () => ShowCompaniesAndClientsUseCase(sl.get<ShowCompaniesAndClientsRepo>()),
  );

  // delete user

  sl.registerLazySingleton<DeleteUserRemoteDataSource>(
    () => DeleteUserRemoteDataSourceImpl(sl.get<ApiService>()),
  );

  sl.registerLazySingleton<DeleteUserRepo>(
    () => DeleteUserRepoImpl(sl.get<DeleteUserRemoteDataSource>()),
  );

  sl.registerLazySingleton<DeleteUserUseCase>(
    () => DeleteUserUseCase(sl.get<DeleteUserRepo>())
  );

  // get approved shipments
  
  sl.registerLazySingleton<GetApprovedShipmentsRemoteDataSource>(
    () => GetApprovedShipmentsRemoteDataSourceImpl(sl.get<ApiService>()),
  );

  sl.registerLazySingleton<GetApprovedShipmentsLocalDataSource>(
    () => GetApprovedShipmentsLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<GetApprovedShipmentsRepo>(
    () => GetApprovedShipmentsRepoImpl(
     sl.get<GetApprovedShipmentsRemoteDataSource>(),
     sl.get<GetApprovedShipmentsLocalDataSource>()
    ),
  );

  sl.registerLazySingleton<GetApprovedShipmentsUseCase>(
    () => GetApprovedShipmentsUseCase(sl.get<GetApprovedShipmentsRepo>()),
  );


}
