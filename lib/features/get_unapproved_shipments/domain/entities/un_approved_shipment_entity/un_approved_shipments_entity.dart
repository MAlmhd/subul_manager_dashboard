import 'package:hive/hive.dart';

part 'un_approved_shipments_entity.g.dart';

@HiveType(typeId: 3)
class UnApprovedShipmentsEntity extends HiveObject {
  @HiveField(0)
  final int idOfShipment;

  @HiveField(1)
  final String trackingString;

  @HiveField(2)
  final String typeOfShipment;

  @HiveField(3)
  final int idOfCustomer;

  @HiveField(4)
  final String nameOfCustomer;

  @HiveField(5)
  final String statusOfShipment;

  @HiveField(6)
  final int numberOfShipments;

  UnApprovedShipmentsEntity(
    this.idOfShipment,
    this.trackingString,
    this.typeOfShipment,
    this.idOfCustomer,
    this.nameOfCustomer,
    this.statusOfShipment,
    this.numberOfShipments,
  );

  

 
}
