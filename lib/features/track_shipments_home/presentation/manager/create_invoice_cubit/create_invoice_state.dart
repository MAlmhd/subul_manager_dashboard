part of 'create_invoice_cubit.dart';

sealed class CreateInvoiceState extends Equatable {
  const CreateInvoiceState();

  @override
  List<Object> get props => [];
}

final class CreateInvoiceInitial extends CreateInvoiceState {}

final class CreateInvoiceFailure extends CreateInvoiceState {
  final String message;

  const CreateInvoiceFailure(this.message);
}

final class CreateInvoiceLoading extends CreateInvoiceState {}

final class CreateInvoiceSuccess extends CreateInvoiceState {
  final BillEntity bill;

  const CreateInvoiceSuccess(this.bill);
}
