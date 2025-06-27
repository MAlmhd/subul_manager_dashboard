import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/bill_entity/bill_entity.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/use_case/create_invoice_use_case/create_invoice_use_case.dart';

part 'create_invoice_state.dart';

class CreateInvoiceCubit extends Cubit<CreateInvoiceState> {
  CreateInvoiceCubit(this.createInvoiceUseCase) : super(CreateInvoiceInitial());
  final CreateInvoiceUseCase createInvoiceUseCase;

  Future<void> createInvoice({
    required int customerId,
    required int shipmentId,
    required double amount,
    required bool includesTax,
    required double taxAmount,
    required DateTime payableAt,
  }) async {
    emit(CreateInvoiceLoading());
    CreateInvoiceParam createInvoiceParam = CreateInvoiceParam(
      customerId,
      shipmentId,
      amount,
      includesTax,
      taxAmount,
      payableAt,
    );
    var result = await createInvoiceUseCase.call(createInvoiceParam);
    result.fold(
      (failure) {
        emit(CreateInvoiceFailure(failure.message));
      },
      (success) {
        emit(CreateInvoiceSuccess(success));
      },
    );
  }
}
