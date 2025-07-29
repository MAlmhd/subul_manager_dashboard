class GetInvoicesEntity {
  final int id;
  final String payableAt;
  final String invoiceNumber;
  final String amount;
  final String name;
  final String phone;
  final String customerCode;
  final int declaredParcelsCount;
  final String supplierName;
  final String qrCode;
  final String taxAmount;
  final String totalAmount;
  final String status;
  final String createdAt;
  final bool success;

  GetInvoicesEntity({required this.success, 
    required this.taxAmount,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    required this.id,
    required this.payableAt,
    required this.invoiceNumber,
    required this.amount,
    required this.name,
    required this.phone,
    required this.customerCode,
    required this.declaredParcelsCount,
    required this.supplierName,
    required this.qrCode,
  });
}
