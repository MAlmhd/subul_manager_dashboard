import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/data/data_source/reject_shipment_data_soure/reject_shipment_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/response_of_reject_shipment_entity/response_of_reject_shipment_entity.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/repos/reject_shipment_repo/reject_shipment_repo.dart';

class RejectShipmentRepoImpl implements RejectShipmentRepo {
  final RejectShipmentRemoteDataSource rejectShipmentRemoteDataSource;

  RejectShipmentRepoImpl(this.rejectShipmentRemoteDataSource);

  @override
  Future<Either<Failure, ResponseOfRejectShipmentEntity>> reject({
    required int id,
    required String reason,
  }) async {
    try {
      ResponseOfRejectShipmentEntity entity =
          await rejectShipmentRemoteDataSource.reject(id: id, reason: reason);

      return right(entity);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
