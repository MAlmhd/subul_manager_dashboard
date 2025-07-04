import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/get_customer_shipment/domain/entities/shipment_of_customer_entity.dart';

abstract class GetCustomerShipmentsRepo {
  Future<Either<Failure, List<ShipmentOfCustomerEntity>>>
  getCustomerShipments({required String code});
}
