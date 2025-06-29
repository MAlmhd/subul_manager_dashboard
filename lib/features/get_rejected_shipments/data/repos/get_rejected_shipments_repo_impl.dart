import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/get_rejected_shipments/data/data_source/get_rejected_shipments_local_data_source.dart';
import 'package:subul_manager_dashboard/features/get_rejected_shipments/data/data_source/get_rejected_shipments_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/get_rejected_shipments/domain/entities/rejected_shipment_entity.dart';
import 'package:subul_manager_dashboard/features/get_rejected_shipments/domain/repos/get_rejected_shipments_repo.dart';

class GetRejectedShipmentsRepoImpl implements GetRejectedShipmentsRepo {
  final GetRejectedShipmentsRemoteDataSource
  getRejectedShipmentsRemoteDataSource;
  final GetRejectedShipmentsLocalDataSource getRejectedShipmentsLocalDataSource;

  GetRejectedShipmentsRepoImpl(
    this.getRejectedShipmentsRemoteDataSource,
    this.getRejectedShipmentsLocalDataSource,
  );
  @override
  Future<Either<Failure, List<RejectedShipmentEntity>>>
  getRejectedShipments() async {
    try {
      List<RejectedShipmentEntity> shipments;

      shipments = getRejectedShipmentsLocalDataSource.getRejectedShipments();

      if (shipments.isNotEmpty) {
        return right(shipments);
      }

      shipments =
          await getRejectedShipmentsRemoteDataSource.getrejectedShipments();

      return right(shipments);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
