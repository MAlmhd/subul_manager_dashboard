// import 'package:hive/hive.dart';
// import 'package:subul_manager_dashboard/core/helpers/constants.dart';
// import 'package:subul_manager_dashboard/features/get_rejected_shipments/domain/entities/rejected_shipment_entity.dart';

// abstract class GetRejectedShipmentsLocalDataSource {
//   List<RejectedShipmentEntity> getRejectedShipments();
// }

// class GetRejectedShipmentsLocalDataSourceImpl
//     implements GetRejectedShipmentsLocalDataSource {
//   @override
//   List<RejectedShipmentEntity> getRejectedShipments() {
//     var box = Hive.box<RejectedShipmentEntity>(kRejectedShipments);
//     return box.values.toList();
//   }
// }
