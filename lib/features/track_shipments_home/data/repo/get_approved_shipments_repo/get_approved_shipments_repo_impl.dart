import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/data/data_source/get_approved_shipments_data_source/get_approved_shipments_local_data_source.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/data/data_source/get_approved_shipments_data_source/get_approved_shipments_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/approved_shipment_entity/approved_shipment_entity.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/repos/get_approved_shipments_repo/get_approved_shipments_repo.dart';

class GetApprovedShipmentsRepoImpl implements GetApprovedShipmentsRepo {
  final GetApprovedShipmentsRemoteDataSource
  getApprovedShipmentsRemoteDataSource;
  final GetApprovedShipmentsLocalDataSource getApprovedShipmentsLocalDataSource;

  GetApprovedShipmentsRepoImpl(
    this.getApprovedShipmentsRemoteDataSource,
    this.getApprovedShipmentsLocalDataSource,
  );
  @override
  Future<Either<Failure, List<ApprovedShipmentEntity>>> getApprovedShipments(
    String? searchItem,
  ) async {
    try {
      List<ApprovedShipmentEntity> shipments;
      if (searchItem != null) {
        shipments = await getApprovedShipmentsRemoteDataSource
            .getApprovedShipment(searchItem);
        return right(shipments);
      }

      shipments = getApprovedShipmentsLocalDataSource.getApprovedShipments();

      if (shipments.isNotEmpty) {
        return right(shipments);
      }

      shipments = await getApprovedShipmentsRemoteDataSource
          .getApprovedShipment(searchItem);

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
