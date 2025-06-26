import 'package:subul_manager_dashboard/core/data/auth_local_data_source.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/utils/api_service.dart';
import 'package:subul_manager_dashboard/core/utils/functions/save_data.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/data/models/approved_shipment_model/approved_shipment_model.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/approved_shipment_entity/approved_shipment_entity.dart';

abstract class GetApprovedShipmentsRemoteDataSource {
  Future<List<ApprovedShipmentEntity>> getApprovedShipment(String? searchItem);
}

class GetApprovedShipmentsRemoteDataSourceImpl
    implements GetApprovedShipmentsRemoteDataSource {
  final ApiService _apiService;

  GetApprovedShipmentsRemoteDataSourceImpl(this._apiService);
  @override
  Future<List<ApprovedShipmentEntity>> getApprovedShipment(
    String? searchItem,
  ) async {
    final token = await sl.get<AuthLocalDataSource>().getToken();
    var data;
    if (searchItem == null) {
       data = await _apiService.get(
        endPoint: 'get/approved/shipments',
        headers: {'Authorization': 'Bearer $token'},
      );
    } else {
      data = await _apiService.get(
        endPoint: 'get/approved/shipments?search=$searchItem',
        headers: {'Authorization': 'Bearer $token'},
      );
    }
    List<ApprovedShipmentEntity> shipments = [];
    if (data['data'] == null) {
      return [];
    }
    for (var element in data['data']) {
      shipments.add(ApprovedShipmentModel.fromJson(element));
    }

    saveData<ApprovedShipmentEntity>(shipments, kApprovedShipments);

    return shipments;
  }
}
