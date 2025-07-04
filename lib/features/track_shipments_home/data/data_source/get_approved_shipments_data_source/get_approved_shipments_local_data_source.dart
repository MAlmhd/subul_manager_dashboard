// import 'package:hive/hive.dart';
// import 'package:subul_manager_dashboard/core/helpers/constants.dart';
// import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/approved_shipment_entity/approved_shipment_entity.dart';

// abstract class GetApprovedShipmentsLocalDataSource {
//   List<ApprovedShipmentEntity> getApprovedShipments();
// }

// class GetApprovedShipmentsLocalDataSourceImpl
//     implements GetApprovedShipmentsLocalDataSource {
//   @override
//   List<ApprovedShipmentEntity> getApprovedShipments() {
//     var box = Hive.box<ApprovedShipmentEntity>(kApprovedShipments);
//     return box.values.toList();
//   }
// }
