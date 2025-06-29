import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/get_rejected_shipments/domain/entities/rejected_shipment_entity.dart';

abstract class GetRejectedShipmentsRepo {
  Future<Either<Failure, List<RejectedShipmentEntity>>> getRejectedShipments();
}
