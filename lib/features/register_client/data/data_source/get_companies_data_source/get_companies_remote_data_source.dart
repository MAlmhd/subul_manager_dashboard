import 'package:subul_manager_dashboard/core/data/auth_local_data_source.dart';
import 'package:subul_manager_dashboard/core/utils/functions/save_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/utils/api_service.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/features/register_client/data/models/company_model/company_model.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/entites/company_entity/company_entity.dart';

abstract class GetCompaniesRemoteDataSource {
  Future<List<CompanyEntity>> fetchCompanies();
}

class GetCompaniesRemoteDataSourceImpl implements GetCompaniesRemoteDataSource {
  final ApiService _apiService;

  GetCompaniesRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<CompanyEntity>> fetchCompanies() async {
    final token = await sl.get<AuthLocalDataSource>().getToken();
    var data = await _apiService.get(
      endPoint: 'getAll/companies',
      headers: {'Authorization': 'Bearer $token'},
    );

    List<CompanyEntity> companies = [];
    if (data['data'] == null) {
      return [];
    }
    for (var company in data['data']) {
      companies.add(CompanyModel.fromJson(company));
    }

   // saveData<CompanyEntity>(companies, kCompaniesBox);

    return companies;
  }
}
