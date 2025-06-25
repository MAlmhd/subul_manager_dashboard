import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/approved_shipment_entity/approved_shipment_entity.dart';

class ApprovedShipmentModel extends ApprovedShipmentEntity{
  final int id;
  final String trackingNumber;
  final String type;
  final int customerId;
  final String? customerName;
  final String status;
  final int declaredParcelsCount;
  final DateTime createdAt;

  ApprovedShipmentModel({
    required this.id,
    required this.trackingNumber,
    required this.type,
    required this.customerId,
    this.customerName,
    required this.status,
    required this.declaredParcelsCount,
    required this.createdAt,
  }) : super(id, trackingNumber, type, customerId, customerName ?? " No name", status, declaredParcelsCount);

  factory ApprovedShipmentModel.fromJson(Map<String, dynamic> json) {
    return ApprovedShipmentModel(
      id: json['id'],
      trackingNumber: json['tracking_number'],
      type: json['type'],
      customerId: json['customer_id'],
      customerName: json['customer_name'],
      status: json['status'],
      declaredParcelsCount: json['declared_parcels_count'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tracking_number': trackingNumber,
      'type': type,
      'customer_id': customerId,
      'customer_name': customerName,
      'status': status,
      'declared_parcels_count': declaredParcelsCount,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
