class ShipmentOfCustomerEntity {
  final int shipmentId;
  final String trackingNumber;
  final String type;
  final String customerName;
  final String status;
  final int decalredParcelsCount;

  ShipmentOfCustomerEntity({required this.shipmentId, required this.trackingNumber, required this.type, required this.customerName, required this.status, required this.decalredParcelsCount});

}
