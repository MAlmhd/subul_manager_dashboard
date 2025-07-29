class InvoiceDetails {
	int? id;
	String? payableAt;
	String? invoiceNumber;
	String? amount;
	String? name;
	String? phone;
	String? customerCode;
	int? declaredParcelsCount;
	String? supplierName;
	String? qrCode;

	InvoiceDetails({
		this.id, 
		this.payableAt, 
		this.invoiceNumber, 
		this.amount, 
		this.name, 
		this.phone, 
		this.customerCode, 
		this.declaredParcelsCount, 
		this.supplierName, 
		this.qrCode, 
	});

	factory InvoiceDetails.fromJson(Map<String, dynamic> json) {
		return InvoiceDetails(
			id: json['id'] as int?,
			payableAt: json['payable_at'] as String?,
			invoiceNumber: json['invoice_number'] as String?,
			amount: json['amount'] as String?,
			name: json['name'] as String?,
			phone: json['phone'] as String?,
			customerCode: json['customer_code'] as String?,
			declaredParcelsCount: json['declared_parcels_count'] as int?,
			supplierName: json['supplier_name'] as String?,
			qrCode: json['qr_code'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'payable_at': payableAt,
				'invoice_number': invoiceNumber,
				'amount': amount,
				'name': name,
				'phone': phone,
				'customer_code': customerCode,
				'declared_parcels_count': declaredParcelsCount,
				'supplier_name': supplierName,
				'qr_code': qrCode,
			};
}
