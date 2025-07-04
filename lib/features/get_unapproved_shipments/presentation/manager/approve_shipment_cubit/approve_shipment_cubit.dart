import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/response_of_approve_shipment_entity/response_of_approve_shipment_entity.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/use_case/approve_shipment_use_case/approve_shipment_use_case.dart';

part 'approve_shipment_state.dart';

class ApproveShipmentCubit extends Cubit<ApproveShipmentState> {
  ApproveShipmentCubit(this.approveShipmentUseCase)
    : super(ApproveShipmentInitial());
  final ApproveShipmentUseCase approveShipmentUseCase;

  Future<void> approve({required int id}) async {
    emit(ApproveShipmentLoading());
    var data = await approveShipmentUseCase.call(id);
    data.fold(
      (failure) {
        emit(ApproveShipmentFailure(failure.message));
      },
      (success) {
        emit(ApproveShipmentSuccess(success));
      },
    );
  }
}
