import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/core/use_cases/use_case.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/approved_shipment_entity/approved_shipment_entity.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/repos/get_approved_shipments_repo/get_approved_shipments_repo.dart';

class GetApprovedShipmentsUseCase
    extends UseCase<List<ApprovedShipmentEntity>, String?> {
  final GetApprovedShipmentsRepo getApprovedShipmentsRepo;

  GetApprovedShipmentsUseCase(this.getApprovedShipmentsRepo);

  @override
  Future<Either<Failure, List<ApprovedShipmentEntity>>> call([
    String? params,
  ]) async {
    return await getApprovedShipmentsRepo.getApprovedShipments(params);
  }
}
