import 'package:subul_manager_dashboard/core/data/auth_local_data_source.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/utils/api_service.dart';
import 'package:subul_manager_dashboard/core/utils/functions/save_data.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/data/models/unapproved_shipment_model.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/un_approved_shipments_entity.dart';

abstract class GetUnapprovedShipmentsRemoteDataSource {
  Future<List<UnApprovedShipmentsEntity>> getUnapprovedShipments([
    String? searchItem,
  ]);
}

class GetUnapprovedShipmentsRemoteDataSourceImpl
    implements GetUnapprovedShipmentsRemoteDataSource {
  final ApiService _apiService;

  GetUnapprovedShipmentsRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<UnApprovedShipmentsEntity>> getUnapprovedShipments([
    String? searchItem,
  ]) async {
    final token = await sl.get<AuthLocalDataSource>().getToken();
    var data;
    if(searchItem == null)
    {
       data = await _apiService.get(endPoint: 'get/unapproved/shipments',headers: {'Authorization': 'Bearer $token'});
    }else
    {
      data = await _apiService.get(endPoint: 'get/unapproved/shipments?search=$searchItem',headers: {'Authorization': 'Bearer $token'});
    }
    List<UnApprovedShipmentsEntity> shipments = [];
    if (data['data'] == null) {
      return [];
    }
    for (var element in data['data']) {
      shipments.add(UnapprovedShipmentModel.fromJson(element));
    }

    saveData<UnApprovedShipmentsEntity>(shipments, kUnapprovedShipments);

    return shipments;
  }
}
