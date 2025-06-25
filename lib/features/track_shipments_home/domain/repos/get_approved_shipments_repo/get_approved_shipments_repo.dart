import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/approved_shipment_entity/approved_shipment_entity.dart';

abstract class GetApprovedShipmentsRepo {
  Future<Either<Failure, List<ApprovedShipmentEntity>>> getApprovedShipments();
}
