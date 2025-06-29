import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/core/use_cases/use_case.dart';
import 'package:subul_manager_dashboard/features/get_rejected_shipments/domain/entities/rejected_shipment_entity.dart';
import 'package:subul_manager_dashboard/features/get_rejected_shipments/domain/repos/get_rejected_shipments_repo.dart';

class GetRejectedShipmentsUseCase
    extends UseCase<List<RejectedShipmentEntity>, NoParam> {
  final GetRejectedShipmentsRepo getRejectedShipmentsRepo;

  GetRejectedShipmentsUseCase(this.getRejectedShipmentsRepo);
  @override
  Future<Either<Failure, List<RejectedShipmentEntity>>> call([
    NoParam? params,
  ]) async {
    return getRejectedShipmentsRepo.getRejectedShipments();
  }
}
