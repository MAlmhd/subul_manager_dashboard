import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/bill_entity/bill_entity.dart';

class BillModel extends BillEntity {
  final int customerId;
  final int shipmentId;
  final String invoiceNumber;
  final int amount;
  final bool includesTax;
  final double taxAmount;
  final double totalAmount;
  final String payableAt;
  final String status;
  final String updatedAt;
  final String createdAt;
  final int id;

  BillModel({
    required this.customerId,
    required this.shipmentId,
    required this.invoiceNumber,
    required this.amount,
    required this.includesTax,
    required this.taxAmount,
    required this.totalAmount,
    required this.payableAt,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  }) : super(
         idOfCustomer: customerId,
         idOfShipment: shipmentId,
         numberOfInvoice: invoiceNumber,
         amount: amount,
         isIncludTax: includesTax,
         amountOfTax: taxAmount,
         totalAmount: totalAmount,
         dateOfPay: payableAt,
         status: status,
         id: id,
       );

  factory BillModel.fromJson(Map<String, dynamic> json) {
    return BillModel(
      customerId: int.parse(json['customer_id'].toString()),
      shipmentId: int.parse(json['shipment_id'].toString()),
      invoiceNumber: json['invoice_number'].toString(),
      amount: int.parse(json['amount'].toString()),
      includesTax: json['includes_tax'].toString() == "1",
      taxAmount:
          double.tryParse(json['tax_amount']?.toString() ?? '0.0') ?? 0.0,
      totalAmount:
          double.tryParse(json['total_amount']?.toString() ?? '0.0') ?? 0.0,

      payableAt: json['payable_at'].toString(),
      status: json['status'].toString(),
      updatedAt: json['updated_at'].toString(),
      createdAt: json['created_at'].toString(),
      id: int.parse(json['id'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    'customer_id': customerId,
    'shipment_id': shipmentId,
    'invoice_number': invoiceNumber,
    'amount': amount,
    'includes_tax': includesTax ? 1 : 0,
    'tax_amount': taxAmount,
    'total_amount': totalAmount,
    'payable_at': payableAt,
    'status': status,
    'updated_at': updatedAt,
    'created_at': createdAt,
    'id': id,
  };
}
