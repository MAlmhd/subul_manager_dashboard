import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/core/use_cases/use_case.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/get_ivoices_entity/get_invoices_entity.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/repos/get_invoices_repo/get_invoices_repo.dart';

class GetInvoiceUseCase extends UseCase<GetInvoicesEntity, int> {
  final GetInvoicesRepo getInvoicesRepo;

  GetInvoiceUseCase({required this.getInvoicesRepo});
  @override
  Future<Either<Failure, GetInvoicesEntity>> call([int? params]) async {
    return await getInvoicesRepo.getInvoices(id: params!);
    
  }
}
