import 'package:subul_manager_dashboard/core/data/auth_local_data_source.dart';
import 'package:subul_manager_dashboard/core/utils/api_service.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/features/get_customer_shipment/data/models/shipment_of_customer_model.dart';
import 'package:subul_manager_dashboard/features/get_customer_shipment/domain/entities/shipment_of_customer_entity.dart';

abstract class GetCustomerShipmentsRemoteDataSource {
  Future<List<ShipmentOfCustomerEntity>> getCustomerShipments({
    required String code,
  });
}

class GetCustomerShipmentsRemoteDataSourceImpl
    implements GetCustomerShipmentsRemoteDataSource {
  final ApiService _apiService;

  GetCustomerShipmentsRemoteDataSourceImpl(this._apiService);
  @override
  Future<List<ShipmentOfCustomerEntity>> getCustomerShipments({
    required String code,
  })async {
     final token = await sl.get<AuthLocalDataSource>().getToken();
    var data = await _apiService.get(
      endPoint: 'get/customer/shipments?customer_code=$code',
      headers: {'Authorization': 'Bearer $token'},
    );

    List<ShipmentOfCustomerEntity> shipments = [];
    if (data['data'] == null) {
      return [];
    }
    for (var shipment in data['data']) {
      shipments.add(ShipmentOfCustomerModel.fromJson(shipment));
    }

 
    return shipments;
  }
}
