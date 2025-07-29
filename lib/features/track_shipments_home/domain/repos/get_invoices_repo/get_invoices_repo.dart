import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/get_ivoices_entity/get_invoices_entity.dart';

abstract class GetInvoicesRepo {
  Future<Either<Failure, GetInvoicesEntity>> getInvoices({required int id});
}
