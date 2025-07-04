part of 'approve_shipment_cubit.dart';

sealed class ApproveShipmentState extends Equatable {
  const ApproveShipmentState();

  @override
  List<Object> get props => [];
}

final class ApproveShipmentInitial extends ApproveShipmentState {}

final class ApproveShipmentFailure extends ApproveShipmentState {
  final String message;

  const ApproveShipmentFailure(this.message);
}

final class ApproveShipmentLoading extends ApproveShipmentState {}

final class ApproveShipmentSuccess extends ApproveShipmentState {
  final ResponseOfApproveShipmentEntity entity;

  const ApproveShipmentSuccess(this.entity);
}
