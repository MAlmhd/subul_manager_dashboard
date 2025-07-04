import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subul_manager_dashboard/features/get_customer_shipment/domain/entities/shipment_of_customer_entity.dart';
import 'package:subul_manager_dashboard/features/get_customer_shipment/domain/use_case/get_customer_shipments_use_case.dart';

part 'get_customer_shipments_state.dart';

class GetCustomerShipmentsCubit extends Cubit<GetCustomerShipmentsState> {
  GetCustomerShipmentsCubit(this.getCustomerShipmentsUseCase)
    : super(GetCustomerShipmentsInitial());
  final GetCustomerShipmentsUseCase getCustomerShipmentsUseCase;

  Future<void> getCustomerShipments({required String code}) async {
    emit(GetCustomerShipmentsLoading());
    var data = await getCustomerShipmentsUseCase.call(code);

    data.fold(
      (failure) {
        emit(GetCustomerShipmentsFailure(failure.message));
      },
      (success) {
        emit(GetCustomerShipmentsSuccess(success));
      },
    );
  }
}
