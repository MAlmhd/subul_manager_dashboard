import 'package:subul_manager_dashboard/core/data/auth_local_data_source.dart';
import 'package:subul_manager_dashboard/core/utils/api_service.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/data/models/bill_model/bill_model.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/bill_entity/bill_entity.dart';

abstract class CreateInvoiceRemoteDataSource {
  Future<BillEntity> createInvoice({
    required int customerId,
    required int shipmentId,
    required double amount,
    required bool includesTax,
    required double taxAmount,
    required DateTime payableAt,
  });
}

class CreateInvoiceRemoteDataSourceImpl
    implements CreateInvoiceRemoteDataSource {
  final ApiService _apiService;

  CreateInvoiceRemoteDataSourceImpl(this._apiService);
  @override
  Future<BillEntity> createInvoice({
    required int customerId,
    required int shipmentId,
    required double amount,
    required bool includesTax,
    required double taxAmount,
    required DateTime payableAt,
  }) async {
    final token = sl.get<AuthLocalDataSource>().getToken();
    var data = await _apiService.post(
      endPoint: 'create/invoice',
      headers: {'Authorization': 'Bearer $token'},
      data: {
        'customer_id': customerId,
        'shipment_id': shipmentId,
        'amount': amount,
        'includes_tax': includesTax,
        'tax_amount': taxAmount,
        'payable_at': payableAt,
      },
    );

    BillEntity bill = BillModel.fromJson(data);
    return bill;
  }
}
