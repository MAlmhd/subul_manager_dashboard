import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/bill_entity/bill_entity.dart';

class BillModel extends BillEntity{
	String? customerId;
	String? shipmentId;
	String? invoiceNumber;
	String? amount2;
	String? includesTax;
	String? taxAmount;
	double? totalAmount2;
	String? payableAt;
	String? status2;
	DateTime? updatedAt;
	DateTime? createdAt;
	int? id;

	BillModel({
		this.customerId, 
		this.shipmentId, 
		this.invoiceNumber, 
		this.amount2, 
		this.includesTax, 
		this.taxAmount, 
		this.totalAmount2, 
		this.payableAt, 
		this.status2, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	}) : super(idOfCustomer: customerId!, idOfShipment: shipmentId!, numberOfInvoice: invoiceNumber!, amount: amount2!, isIncludTax: includesTax!, amountOfTax: taxAmount!, totalAmount: totalAmount2!, dateOfPay: payableAt!, status: status2!) ;

	factory BillModel.fromJson(Map<String, dynamic> json) => BillModel(
				customerId: json['customer_id'] as String?,
				shipmentId: json['shipment_id'] as String?,
				invoiceNumber: json['invoice_number'] as String?,
				amount2: json['amount'] as String?,
				includesTax: json['includes_tax'] as String?,
				taxAmount: json['tax_amount'] as String?,
				totalAmount2: (json['total_amount'] as num?)?.toDouble(),
				payableAt: json['payable_at'] as String?,
				status2: json['status'] as String?,
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				id: json['id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'customer_id': customerId,
				'shipment_id': shipmentId,
				'invoice_number': invoiceNumber,
				'amount': amount2,
				'includes_tax': includesTax,
				'tax_amount': taxAmount,
				'total_amount': totalAmount2,
				'payable_at': payableAt,
				'status': status2,
				'updated_at': updatedAt?.toIso8601String(),
				'created_at': createdAt?.toIso8601String(),
				'id': id,
			};
}
