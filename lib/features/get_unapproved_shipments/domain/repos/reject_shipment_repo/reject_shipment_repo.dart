import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/response_of_reject_shipment_entity/response_of_reject_shipment_entity.dart';

abstract class RejectShipmentRepo {
  Future<Either<Failure, ResponseOfRejectShipmentEntity>> reject({required int id,required String reason});
}
