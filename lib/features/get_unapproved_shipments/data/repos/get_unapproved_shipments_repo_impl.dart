import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/data/data_source/get_unapproved_shipments_local_data_source.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/data/data_source/get_unapproved_shipments_remote_data_source.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/un_approved_shipments_entity.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/repos/get_unapproved_shipments_repo.dart';

class GetUnapprovedShipmentsRepoImpl implements GetUnapprovedShipmentsRepo {
  final GetUnapprovedShipmentsRemoteDataSource
  getUnapprovedShipmentsRemoteDataSource;
  final GetUnapprovedShipmentsLocalDataSource
  getUnapprovedShipmentsLocalDataSource;

  GetUnapprovedShipmentsRepoImpl(
    this.getUnapprovedShipmentsRemoteDataSource,
    this.getUnapprovedShipmentsLocalDataSource,
  );
  @override
  Future<Either<Failure, List<UnApprovedShipmentsEntity>>>
  getUnapprovedShipments([String? searchItem]) async {
    try {
      List<UnApprovedShipmentsEntity> shipments;
      if (searchItem != null) {
        shipments =
            await getUnapprovedShipmentsRemoteDataSource
                .getUnapprovedShipments(searchItem);
        return right(shipments);
      }
      shipments =
          getUnapprovedShipmentsLocalDataSource.getUnapprovedShipments();

      if (shipments.isNotEmpty) {
        return right(shipments);
      }

      shipments =
          await getUnapprovedShipmentsRemoteDataSource.getUnapprovedShipments();

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
