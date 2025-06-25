import 'package:subul_manager_dashboard/core/data/auth_local_data_source.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/utils/api_service.dart';
import 'package:subul_manager_dashboard/core/utils/functions/save_data.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/data/models/show_companies_and_clients_model/show_companies_and_clients_model.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/entities/comanies_and_clients_entity/companies_and_clients_entity.dart';

abstract class ShowCompaniesAndClientsRemoteDataSource {
  Future<List<CompaniesAndClientsEntity>> showCompaniesAndClients();
}

class ShowCompaniesAndClientsRemoteDataSourceImpl
    implements ShowCompaniesAndClientsRemoteDataSource {
  final ApiService _apiService;

  ShowCompaniesAndClientsRemoteDataSourceImpl(this._apiService);
  @override
  Future<List<CompaniesAndClientsEntity>> showCompaniesAndClients() async {
    final token = await sl.get<AuthLocalDataSource>().getToken();
    var data = await _apiService.get(
      endPoint: 'getAll/Customers',
      headers: {'Authorization': 'Bearer $token'},
    );
    List<CompaniesAndClientsEntity> clients = [];
    if (data['data'] == null) {
      return [];
    }
    for (var element in data['data']) {
      clients.add(CompaniesAndClientsModel.fromJson(element));
    }

    saveData<CompaniesAndClientsEntity>(clients, kCompaniesAndClients);

    return clients;
  }
}
