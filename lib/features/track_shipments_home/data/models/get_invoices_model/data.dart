import 'invoice_details.dart';

class Data {
	InvoiceDetails? invoiceDetails;
	String? taxAmount;
	String? totalAmount;
	int? includesTax;
	String? status;
	String? createdAt;

	Data({
		this.invoiceDetails, 
		this.taxAmount, 
		this.totalAmount, 
		this.includesTax, 
		this.status, 
		this.createdAt, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				invoiceDetails: json['invoice_details'] == null
						? null
						: InvoiceDetails.fromJson(json['invoice_details'] as Map<String, dynamic>),
				taxAmount: json['tax_amount'] as String?,
				totalAmount: json['total_amount'] as String?,
				includesTax: json['includes_tax'] as int?,
				status: json['status'] as String?,
				createdAt: json['created_at'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'invoice_details': invoiceDetails?.toJson(),
				'tax_amount': taxAmount,
				'total_amount': totalAmount,
				'includes_tax': includesTax,
				'status': status,
				'created_at': createdAt,
			};
}
