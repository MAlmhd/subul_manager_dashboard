import 'package:subul_manager_dashboard/core/data/auth_local_data_source.dart';
import 'package:subul_manager_dashboard/core/utils/api_service.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/data/models/reject_shipment_model/response_of_reject_shipment_model/response_of_reject_shipment_model.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/response_of_reject_shipment_entity/response_of_reject_shipment_entity.dart';

abstract class RejectShipmentRemoteDataSource {
  Future<ResponseOfRejectShipmentEntity> reject({
    required int id,
    required String reason,
  });
}

class RejectShipmentRemoteDataSourceImpl
    implements RejectShipmentRemoteDataSource {
  final ApiService _apiService;

  RejectShipmentRemoteDataSourceImpl(this._apiService);
  @override
  Future<ResponseOfRejectShipmentEntity> reject({
    required int id,
    required String reason,
  }) async {
    final token = await sl.get<AuthLocalDataSource>().getToken();
    var response = await _apiService.post(
      endPoint: 'reject/shipments',
      headers: {'Authorization': 'Bearer $token'},
      data: {
        'shipment_id':id,
        'cancellation_reason':reason,
      }
    );

    ResponseOfRejectShipmentEntity entity =
        ResponseOfRejectShipmentModel.fromJson(response);

    return entity;
  }
}
