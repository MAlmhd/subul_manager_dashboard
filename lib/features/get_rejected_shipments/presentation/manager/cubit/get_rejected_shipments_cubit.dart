import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subul_manager_dashboard/features/get_rejected_shipments/domain/entities/rejected_shipment_entity.dart';
import 'package:subul_manager_dashboard/features/get_rejected_shipments/domain/use_case/get_rejected_shipments_use_case.dart';

part 'get_rejected_shipments_state.dart';

class GetRejectedShipmentsCubit extends Cubit<GetRejectedShipmentsState> {
  GetRejectedShipmentsCubit(this.getRejectedShipmentsUseCase)
    : super(GetRejectedShipmentsInitial());
  final GetRejectedShipmentsUseCase getRejectedShipmentsUseCase;

  Future<void> getRejectedShipments() async {
    emit(GetRejectedShipmentsLoading());

    var result = await getRejectedShipmentsUseCase.call();

    result.fold(
      (failure) {
        emit(GetRejectedShipmentsFailure(failure.message));
      },
      (success) {
        emit(GetRejectedShipmentsSuccess(success));
      },
    );
  }
}
