import 'package:subul_manager_dashboard/features/get_customer_shipment/domain/entities/shipment_of_customer_entity.dart';

class ShipmentOfCustomerModel extends ShipmentOfCustomerEntity {
  int? id;
  String? trackingNumber2;
  String? type2;
  String? customerName2;
  String? status2;
  int? declaredParcelsCount; //decalredParcelsCount
  DateTime? createdAt;

  ShipmentOfCustomerModel({
    this.id,
    this.trackingNumber2,
    this.type2,
    this.customerName2,
    this.status2,
    this.declaredParcelsCount,
    this.createdAt,
  }) : super(shipmentId: id!, trackingNumber:trackingNumber2!, type: type2!, customerName: customerName2 ?? " No Name", status: status2!, decalredParcelsCount: declaredParcelsCount ?? 0);

  factory ShipmentOfCustomerModel.fromJson(Map<String, dynamic> json) {
    return ShipmentOfCustomerModel(
      id: json['id'] as int?,
      trackingNumber2: json['tracking_number'] as String?,
      type2: json['type'] as String?,
      customerName2: json['customer_name'] as String?,
      status2: json['status'] as String?,
      declaredParcelsCount: json['declared_parcels_count'] as int?,
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'tracking_number': trackingNumber2,
    'type': type2,
    'customer_name': customerName,
    'status': status2,
    'declared_parcels_count': declaredParcelsCount,
    'created_at': createdAt?.toIso8601String(),
  };
}
