import 'package:hive/hive.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/entites/company_entity/company_entity.dart';

void saveData(List<CompanyEntity> companies, String boxName) {
  // 
    var box = Hive.box<CompanyEntity>(boxName);
    box.clear();
    box.addAll(companies);
  }