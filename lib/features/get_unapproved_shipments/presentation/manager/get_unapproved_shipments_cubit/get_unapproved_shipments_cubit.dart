import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/un_approved_shipment_entity/un_approved_shipments_entity.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/use_case/get_unapproved_shipments_use_case/get_unapproved_shipments_use_case.dart';

part 'get_unapproved_shipments_state.dart';

class GetUnapprovedShipmentsCubit extends Cubit<GetUnapprovedShipmentsState> {
  GetUnapprovedShipmentsCubit(this.getUnapprovedShipmentsUseCase) : super(GetUnapprovedShipmentsInitial());
  final GetUnapprovedShipmentsUseCase getUnapprovedShipmentsUseCase;

  Future<void> getUnapprovedShipments([String? searchItem]) async {
    emit(GetUnapprovedShipmentsLoading());
    var result = await getUnapprovedShipmentsUseCase.call(searchItem);
    result.fold(
      (failure) {
        emit(GetUnapprovedShipmentsFailure(failure.message));
      },
      (success) {
        emit(GetUnapprovedShipmentsSuccess(success));
      },
    );
  }
}
