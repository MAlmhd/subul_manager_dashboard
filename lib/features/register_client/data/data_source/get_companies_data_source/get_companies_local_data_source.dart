// import 'package:hive/hive.dart';
// import 'package:subul_manager_dashboard/core/helpers/constants.dart';
// import 'package:subul_manager_dashboard/features/register_client/domain/entites/company_entity/company_entity.dart';

// abstract class GetCompaniesLocalDataSource {
//   List<CompanyEntity> fetchCompanies();
// }

// class GetCompaniesLocalDataSourceImpl implements GetCompaniesLocalDataSource {
//   @override
//   List<CompanyEntity> fetchCompanies() {
//     var box = Hive.box<CompanyEntity>(kCompaniesBox);
//     return box.values.toList();
//   }
// }
