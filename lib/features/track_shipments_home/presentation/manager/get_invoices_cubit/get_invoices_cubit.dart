import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/get_ivoices_entity/get_invoices_entity.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/use_case/get_invoices_use_case/get_invoice_use_case.dart';

part 'get_invoices_state.dart';

class GetInvoicesCubit extends Cubit<GetInvoicesState> {
  final GetInvoiceUseCase getInvoiceUseCase;
  GetInvoicesCubit(this.getInvoiceUseCase) : super(GetInvoicesInitial());

  Future<void> getInvoice({required int id}) async {
    emit(GetInvoicesLoading());
    var data = await getInvoiceUseCase.call(id);
    data.fold(
      (failure) {
        emit(GetInvoicesFailure(failure.message));
      },
      (success) {
        emit(GetInvoicesSuccess(success));
      },
    );
  }
}
