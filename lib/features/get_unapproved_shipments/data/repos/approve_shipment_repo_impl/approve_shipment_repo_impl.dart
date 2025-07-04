import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/data/data_source/approve_shipment_data_source/approve_shipment_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/response_of_approve_shipment_entity/response_of_approve_shipment_entity.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/repos/approve_shipment_repo/approve_shipment_repo.dart';

class ApproveShipmentRepoImpl implements ApproveShipmentRepo {
  final ApproveShipmentRemoteDataSource approveShipmentRemoteDataSource;

  ApproveShipmentRepoImpl(this.approveShipmentRemoteDataSource);
  @override
  Future<Either<Failure, ResponseOfApproveShipmentEntity>> approve({
    required int id,
  }) async {
    try {
      ResponseOfApproveShipmentEntity entity =
          await approveShipmentRemoteDataSource.approve(id: id);
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
