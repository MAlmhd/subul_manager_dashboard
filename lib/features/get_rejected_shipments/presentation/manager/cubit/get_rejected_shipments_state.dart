part of 'get_rejected_shipments_cubit.dart';

sealed class GetRejectedShipmentsState extends Equatable {
  const GetRejectedShipmentsState();

  @override
  List<Object> get props => [];
}

final class GetRejectedShipmentsInitial extends GetRejectedShipmentsState {}

final class GetRejectedShipmentsFailure extends GetRejectedShipmentsState {
  final String message;

  const GetRejectedShipmentsFailure(this.message);
}

final class GetRejectedShipmentsLoading extends GetRejectedShipmentsState {}

final class GetRejectedShipmentsSuccess extends GetRejectedShipmentsState {
  final List<RejectedShipmentEntity> shipments;

  const GetRejectedShipmentsSuccess(this.shipments);
}
