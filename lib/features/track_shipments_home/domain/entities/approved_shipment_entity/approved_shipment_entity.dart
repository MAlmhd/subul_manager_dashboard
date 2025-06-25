import 'package:hive/hive.dart';
part 'approved_shipment_entity.g.dart';

@HiveType(typeId: 2)
class ApprovedShipmentEntity {
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
  final int numberOfShipment;

  ApprovedShipmentEntity(this.idOfShipment, this.trackingString, this.typeOfShipment, this.idOfCustomer, this.nameOfCustomer, this.statusOfShipment, this.numberOfShipment);
}
