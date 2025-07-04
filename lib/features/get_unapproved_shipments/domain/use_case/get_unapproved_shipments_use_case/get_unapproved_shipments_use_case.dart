import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/core/use_cases/use_case.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/un_approved_shipment_entity/un_approved_shipments_entity.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/repos/get_unapproved_shipment_repo/get_unapproved_shipments_repo.dart';

class GetUnapprovedShipmentsUseCase
    extends UseCase<List<UnApprovedShipmentsEntity>, String?> {
  final GetUnapprovedShipmentsRepo getUnapprovedShipmentsRepo;

  GetUnapprovedShipmentsUseCase(this.getUnapprovedShipmentsRepo);
  
  @override
  Future<Either<Failure, List<UnApprovedShipmentsEntity>>> call([String? params]) async{
    return await getUnapprovedShipmentsRepo.getUnapprovedShipments();
  }
 
  
}
