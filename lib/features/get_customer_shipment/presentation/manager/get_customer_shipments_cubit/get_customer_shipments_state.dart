part of 'get_customer_shipments_cubit.dart';

sealed class GetCustomerShipmentsState extends Equatable {
  const GetCustomerShipmentsState();

  @override
  List<Object> get props => [];
}

final class GetCustomerShipmentsInitial extends GetCustomerShipmentsState {}

final class GetCustomerShipmentsFailure extends GetCustomerShipmentsState {
  final String message;

  const GetCustomerShipmentsFailure(this.message);
}

final class GetCustomerShipmentsLoading extends GetCustomerShipmentsState {}

final class GetCustomerShipmentsSuccess extends GetCustomerShipmentsState {
  final List<ShipmentOfCustomerEntity> shipments;

  const GetCustomerShipmentsSuccess(this.shipments);
}
