part of 'get_approved_shipment_cubit.dart';

sealed class GetApprovedShipmentState extends Equatable {
  const GetApprovedShipmentState();

  @override
  List<Object> get props => [];
}

final class GetApprovedShipmentInitial extends GetApprovedShipmentState {}

final class GetApprovedShipmentFailure extends GetApprovedShipmentState {
  final String message;

  const GetApprovedShipmentFailure(this.message);
}

final class GetApprovedShipmentLoading extends GetApprovedShipmentState {}

final class GetApprovedShipmentSuccess extends GetApprovedShipmentState {
  final List<ApprovedShipmentEntity> shipments;

  const GetApprovedShipmentSuccess(this.shipments);
}
