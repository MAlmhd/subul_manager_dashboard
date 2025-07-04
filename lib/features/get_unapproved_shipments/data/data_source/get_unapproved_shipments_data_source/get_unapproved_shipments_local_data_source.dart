// import 'package:hive/hive.dart';
// import 'package:subul_manager_dashboard/core/helpers/constants.dart';
// import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/un_approved_shipment_entity/un_approved_shipments_entity.dart';

// abstract class GetUnapprovedShipmentsLocalDataSource {
//   List<UnApprovedShipmentsEntity> getUnapprovedShipments();
// }

// class GetUnapprovedShipmentsLocalDataSourceImpl
//     implements GetUnapprovedShipmentsLocalDataSource {
//   @override
//   List<UnApprovedShipmentsEntity> getUnapprovedShipments() {
//     var box = Hive.box<UnApprovedShipmentsEntity>(kUnapprovedShipments);
//     return box.values.toList();
//   }
// }
