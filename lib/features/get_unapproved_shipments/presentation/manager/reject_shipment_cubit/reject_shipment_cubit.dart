import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/response_of_reject_shipment_entity/response_of_reject_shipment_entity.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/use_case/reject_shipment_use_case/reject_shipment_use_case.dart';

part 'reject_shipment_state.dart';

class RejectShipmentCubit extends Cubit<RejectShipmentState> {
  RejectShipmentCubit(this.rejectShipmentUseCase)
    : super(RejectShipmentInitial());
  final RejectShipmentUseCase rejectShipmentUseCase;

  Future<void> reject({required int id, required String reason}) async {
    RejectShipmentParam rejectShipmentParam = RejectShipmentParam(
      id: id,
      reason: reason,
    );
    var data = await rejectShipmentUseCase.call(rejectShipmentParam);

    data.fold(
      (failure) {
        emit(RejectShipmentFailure(failure.message));
      },
      (success) {
        emit(RejectShipmentSuccess(success));
      },
    );
  }
}
