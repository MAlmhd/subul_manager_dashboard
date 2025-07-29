import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/data/data_source/get_invoices_data_source/get_invoices_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/get_ivoices_entity/get_invoices_entity.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/repos/get_invoices_repo/get_invoices_repo.dart';

class GetInvoicesRepoImpl implements GetInvoicesRepo {
  final GetInvoicesRemoteDataSource getInvoicesRemoteDataSource;

  GetInvoicesRepoImpl(this.getInvoicesRemoteDataSource);
  @override
  Future<Either<Failure, GetInvoicesEntity>> getInvoices({
    required int id,
  }) async {
    try {
      var data = await getInvoicesRemoteDataSource.getInvoices(id: id);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
