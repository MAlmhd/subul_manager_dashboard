import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/approved_shipment_entity/approved_shipment_entity.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/use_case/get_approved_shipments_use_case/get_approved_shipments_use_case.dart';

part 'get_approved_shipment_state.dart';

class GetApprovedShipmentCubit extends Cubit<GetApprovedShipmentState> {
  GetApprovedShipmentCubit(this.getApprovedShipmentsUseCase)
    : super(GetApprovedShipmentInitial());
  final GetApprovedShipmentsUseCase getApprovedShipmentsUseCase;

  Future<void> getApprovedShipments() async {
    emit(GetApprovedShipmentLoading());
    var result = await getApprovedShipmentsUseCase.call();
    result.fold(
      (failure) {
        emit(GetApprovedShipmentFailure(failure.message));
      },
      (success) {
        emit(GetApprovedShipmentSuccess(success));
      },
    );
  }
}
