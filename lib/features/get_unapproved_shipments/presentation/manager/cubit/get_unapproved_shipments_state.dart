part of 'get_unapproved_shipments_cubit.dart';

sealed class GetUnapprovedShipmentsState extends Equatable {
  const GetUnapprovedShipmentsState();

  @override
  List<Object> get props => [];
}

final class GetUnapprovedShipmentsInitial extends GetUnapprovedShipmentsState {}

final class GetUnapprovedShipmentsFailure extends GetUnapprovedShipmentsState {
  final String message;

  const GetUnapprovedShipmentsFailure(this.message);
}

final class GetUnapprovedShipmentsLoading extends GetUnapprovedShipmentsState {}

final class GetUnapprovedShipmentsSuccess extends GetUnapprovedShipmentsState {
 final List<UnApprovedShipmentsEntity> shipments;

  const GetUnapprovedShipmentsSuccess(this.shipments);
}
