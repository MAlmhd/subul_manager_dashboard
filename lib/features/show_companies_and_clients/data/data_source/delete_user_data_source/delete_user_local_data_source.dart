// import 'package:hive/hive.dart';
// import 'package:subul_manager_dashboard/core/helpers/constants.dart';
// import 'package:subul_manager_dashboard/features/register_client/domain/entites/company_entity/company_entity.dart';

// abstract class DeleteUserLocalDataSource {
//   Future<void> deleteCompany(int id);
// }

// class DeleteUserLocalDataSourceImpl implements DeleteUserLocalDataSource {
//   @override
//   Future<void> deleteCompany(int id) async {
//     var box = Hive.box<CompanyEntity>(kCompaniesBox);

//     // البحث عن المفتاح
//     final keyToDelete = box.keys.firstWhere(
//       (key) {
//         final item = box.get(key);
//         return item != null && item.id == id;
//       },
//       orElse: () => null,
//     );

//     if (keyToDelete != null) {
//       await box.delete(keyToDelete);
//       print("✅ تم حذف الشركة محليًا بنجاح (id: $id)");
//     } else {
//       print("⚠️ لم يتم العثور على شركة بهذا المعرف (id: $id) في التخزين المحلي");
//     }
//   }
// }
