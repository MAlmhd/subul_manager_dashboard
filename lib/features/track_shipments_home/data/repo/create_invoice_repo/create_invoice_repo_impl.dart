import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/data/data_source/create_invoice_data_source/create_invoice_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/bill_entity/bill_entity.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/repos/create_invoice_repo/create_invoice_repo.dart';

class CreateInvoiceRepoImpl implements CreateInvoiceRepo {
  final CreateInvoiceRemoteDataSource createInvoiceRemoteDataSource;

  CreateInvoiceRepoImpl(this.createInvoiceRemoteDataSource);
  @override
  Future<Either<Failure, BillEntity>> createInvoice({
    required int customerId,
    required int shipmentId,
    required double amount,
    required bool includesTax,

    required String payableAt,
  }) async {
    try {
      var result = await createInvoiceRemoteDataSource.createInvoice(
        customerId: customerId,
        shipmentId: shipmentId,
        amount: amount,
        includesTax: includesTax,
        payableAt: payableAt,
      );
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
