import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/core/use_cases/use_case.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/un_approved_shipments_entity.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/repos/get_unapproved_shipments_repo.dart';

class GetUnapprovedShipmentsUseCase
    extends UseCase<List<UnApprovedShipmentsEntity>, NoParam> {
  final GetUnapprovedShipmentsRepo getUnapprovedShipmentsRepo;

  GetUnapprovedShipmentsUseCase(this.getUnapprovedShipmentsRepo);
  @override
  Future<Either<Failure, List<UnApprovedShipmentsEntity>>> call([
    NoParam? params,
  ]) async {
    return await getUnapprovedShipmentsRepo.getUnapprovedShipments();
  }
}
