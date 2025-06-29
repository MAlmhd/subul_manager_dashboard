import 'package:subul_manager_dashboard/features/get_rejected_shipments/domain/entities/rejected_shipment_entity.dart';

class RejectedShipmentModel extends RejectedShipmentEntity{
	String? trackingNumber2;
	dynamic customerName2;
	String? type2;
	int? declaredParcelsCount2;
	String? status2;
	String? cancellationReason;
	DateTime? createdAt;

	RejectedShipmentModel({
		this.trackingNumber2, 
		this.customerName2, 
		this.type2, 
		this.declaredParcelsCount2, 
		this.status2, 
		this.cancellationReason, 
		this.createdAt, 
	}) : super(trackingNumber: trackingNumber2?? "No tracking number", customerName: customerName2 ?? "No Name", type: type2 ?? "No type", declaredParcelsCount: declaredParcelsCount2 ?? 0, status: status2 ?? "No status", reasonOfCancelltion: cancellationReason ?? "No Reason");

	factory RejectedShipmentModel.fromJson(Map<String, dynamic> json) {
		return RejectedShipmentModel(
			trackingNumber2: json['tracking_number'] as String?,
			customerName2: json['customer_name'] as dynamic,
			type2: json['type'] as String?,
			declaredParcelsCount2: json['declared_parcels_count'] as int?,
			status2: json['status'] as String?,
			cancellationReason: json['cancellation_reason'] as String?,
			createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
		);
	}



	Map<String, dynamic> toJson() => {
				'tracking_number': trackingNumber2,
				'customer_name': customerName2,
				'type': type2,
				'declared_parcels_count': declaredParcelsCount2,
				'status': status2,
				'cancellation_reason': cancellationReason,
				'created_at': createdAt?.toIso8601String(),
			};
}
