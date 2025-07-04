class Data {
	int? id;
	String? trackingNumber;
	String? type;
	int? customerId;
	int? supplierId;
	String? supplierName;
	String? supplierNumber;
	dynamic originCountryId;
	dynamic destinationCountryId;
	String? status;
	int? declaredParcelsCount;
	dynamic actualParcelsCount;
	dynamic sentAt;
	dynamic deliveredAt;
	dynamic costDeliveryOrigin;
	dynamic costExpressOrigin;
	dynamic costCustomsOrigin;
	dynamic costAirFreight;
	dynamic costDeliveryDestination;
	String? cancellationReason;
	String? notes;
	int? createdByUserId;
	int? isApproved;
	int? deliveredToWhDis;
	DateTime? createdAt;
	DateTime? updatedAt;
	dynamic deletedAt;

	Data({
		this.id, 
		this.trackingNumber, 
		this.type, 
		this.customerId, 
		this.supplierId, 
		this.supplierName, 
		this.supplierNumber, 
		this.originCountryId, 
		this.destinationCountryId, 
		this.status, 
		this.declaredParcelsCount, 
		this.actualParcelsCount, 
		this.sentAt, 
		this.deliveredAt, 
		this.costDeliveryOrigin, 
		this.costExpressOrigin, 
		this.costCustomsOrigin, 
		this.costAirFreight, 
		this.costDeliveryDestination, 
		this.cancellationReason, 
		this.notes, 
		this.createdByUserId, 
		this.isApproved, 
		this.deliveredToWhDis, 
		this.createdAt, 
		this.updatedAt, 
		this.deletedAt, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				id: json['id'] as int?,
				trackingNumber: json['tracking_number'] as String?,
				type: json['type'] as String?,
				customerId: json['customer_id'] as int?,
				supplierId: json['supplier_id'] as int?,
				supplierName: json['supplier_name'] as String?,
				supplierNumber: json['supplier_number'] as String?,
				originCountryId: json['origin_country_id'] as dynamic,
				destinationCountryId: json['destination_country_id'] as dynamic,
				status: json['status'] as String?,
				declaredParcelsCount: json['declared_parcels_count'] as int?,
				actualParcelsCount: json['actual_parcels_count'] as dynamic,
				sentAt: json['sent_at'] as dynamic,
				deliveredAt: json['delivered_at'] as dynamic,
				costDeliveryOrigin: json['cost_delivery_origin'] as dynamic,
				costExpressOrigin: json['cost_express_origin'] as dynamic,
				costCustomsOrigin: json['cost_customs_origin'] as dynamic,
				costAirFreight: json['cost_air_freight'] as dynamic,
				costDeliveryDestination: json['cost_delivery_destination'] as dynamic,
				cancellationReason: json['cancellation_reason'] as String?,
				notes: json['notes'] as String?,
				createdByUserId: json['created_by_user_id'] as int?,
				isApproved: json['is_approved'] as int?,
				deliveredToWhDis: json['delivered_to_WH_dis'] as int?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				deletedAt: json['deleted_at'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'tracking_number': trackingNumber,
				'type': type,
				'customer_id': customerId,
				'supplier_id': supplierId,
				'supplier_name': supplierName,
				'supplier_number': supplierNumber,
				'origin_country_id': originCountryId,
				'destination_country_id': destinationCountryId,
				'status': status,
				'declared_parcels_count': declaredParcelsCount,
				'actual_parcels_count': actualParcelsCount,
				'sent_at': sentAt,
				'delivered_at': deliveredAt,
				'cost_delivery_origin': costDeliveryOrigin,
				'cost_express_origin': costExpressOrigin,
				'cost_customs_origin': costCustomsOrigin,
				'cost_air_freight': costAirFreight,
				'cost_delivery_destination': costDeliveryDestination,
				'cancellation_reason': cancellationReason,
				'notes': notes,
				'created_by_user_id': createdByUserId,
				'is_approved': isApproved,
				'delivered_to_WH_dis': deliveredToWhDis,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'deleted_at': deletedAt,
			};
}
