import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/get_ivoices_entity/get_invoices_entity.dart';

import 'data.dart';

class GetInvoicesModel extends GetInvoicesEntity {
  final bool? success2;
  final int? status2;
  final String? message;
  final Data? data;

  GetInvoicesModel({
    this.success2,
    this.status2,
    this.message,
    this.data,
  }) : super(
          success: success2!,
          taxAmount: data?.taxAmount ?? '',
          totalAmount: data?.totalAmount ?? '',
          status: data?.status ?? '',
          createdAt: data?.createdAt ?? '',
          id: data?.invoiceDetails?.id ?? 0,
          payableAt: data?.invoiceDetails?.payableAt ?? '',
          invoiceNumber: data?.invoiceDetails?.invoiceNumber ?? '',
          amount: data?.invoiceDetails?.amount ?? '',
          name: data?.invoiceDetails?.name ?? '',
          phone: data?.invoiceDetails?.phone ?? '',
          customerCode: data?.invoiceDetails?.customerCode ?? '',
          declaredParcelsCount: data?.invoiceDetails?.declaredParcelsCount ?? 0,
          supplierName: data?.invoiceDetails?.supplierName ?? '',
          qrCode: data?.invoiceDetails?.qrCode ?? '',
        );

  factory GetInvoicesModel.fromJson(Map<String, dynamic> json) {
    return GetInvoicesModel(
      success2: json['success'] as bool?,
      status2: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'status': status2,
        'message': message,
        'data': data?.toJson(),
      };
}
