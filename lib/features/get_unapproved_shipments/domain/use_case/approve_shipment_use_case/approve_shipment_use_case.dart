import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/core/use_cases/use_case.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/response_of_approve_shipment_entity/response_of_approve_shipment_entity.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/repos/approve_shipment_repo/approve_shipment_repo.dart';

class ApproveShipmentUseCase
    extends UseCase<ResponseOfApproveShipmentEntity, int> {
  final ApproveShipmentRepo approveShipmentRepo;

  ApproveShipmentUseCase(this.approveShipmentRepo);
  @override
  Future<Either<Failure, ResponseOfApproveShipmentEntity>> call([
    int? id,
  ]) async {
    return await approveShipmentRepo.approve(id: id!);
  }
}
