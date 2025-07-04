part of 'reject_shipment_cubit.dart';

sealed class RejectShipmentState extends Equatable {
  const RejectShipmentState();

  @override
  List<Object> get props => [];
}

final class RejectShipmentInitial extends RejectShipmentState {}

final class RejectShipmentFailure extends RejectShipmentState {
  final String message;

  const RejectShipmentFailure(this.message);
}

final class RejectShipmentLoading extends RejectShipmentState {}

final class RejectShipmentSuccess extends RejectShipmentState {
  final ResponseOfRejectShipmentEntity entity;

  const RejectShipmentSuccess(this.entity);
}
