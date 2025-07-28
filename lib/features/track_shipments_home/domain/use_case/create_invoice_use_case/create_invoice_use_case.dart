import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/core/use_cases/use_case.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/bill_entity/bill_entity.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/repos/create_invoice_repo/create_invoice_repo.dart';

class CreateInvoiceUseCase extends UseCase<BillEntity, CreateInvoiceParam> {
  final CreateInvoiceRepo createInvoiceRepo;

  CreateInvoiceUseCase(this.createInvoiceRepo);
  @override
  Future<Either<Failure, BillEntity>> call([CreateInvoiceParam? params]) async {
    return await createInvoiceRepo.createInvoice(
      customerId: params!.customerId,
      shipmentId: params.shipmentId,
      amount: params.amount,
      includesTax: params.includesTax,
      payableAt: params.payableAt,
    );
  }
}

class CreateInvoiceParam {
  final int customerId;
  final int shipmentId;
  final double amount;
  final bool includesTax;

  final String payableAt;

  CreateInvoiceParam(
    this.customerId,
    this.shipmentId,
    this.amount,
    this.includesTax,

    this.payableAt,
  );
}
