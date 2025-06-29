import 'package:hive/hive.dart';
part 'rejected_shipment_entity.g.dart';

@HiveType(typeId: 4)
class RejectedShipmentEntity {

  @HiveField(0)
  final String trackingNumber;
  @HiveField(1)
  final String customerName;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final int declaredParcelsCount;
  @HiveField(4)
  final String status;
  @HiveField(5)
  final String reasonOfCancelltion;


  RejectedShipmentEntity({
    required this.trackingNumber,
    required this.customerName,
    required this.type,
    required this.declaredParcelsCount,
    required this.status,
    required this.reasonOfCancelltion,
  });
}
