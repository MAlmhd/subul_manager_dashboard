import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/un_approved_shipment_entity/un_approved_shipments_entity.dart';

abstract class GetUnapprovedShipmentsRepo {
  Future<Either<Failure, List<UnApprovedShipmentsEntity>>> getUnapprovedShipments([String? searchItem]);
}
