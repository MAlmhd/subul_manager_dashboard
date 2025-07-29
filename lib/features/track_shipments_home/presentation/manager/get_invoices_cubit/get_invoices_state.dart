part of 'get_invoices_cubit.dart';

sealed class GetInvoicesState extends Equatable {
  const GetInvoicesState();

  @override
  List<Object> get props => [];
}

final class GetInvoicesInitial extends GetInvoicesState {}

final class GetInvoicesLoading extends GetInvoicesState {}

final class GetInvoicesSuccess extends GetInvoicesState {
  final GetInvoicesEntity invoice;

  const GetInvoicesSuccess(this.invoice);
}

final class GetInvoicesFailure extends GetInvoicesState {
  final String message;

  const GetInvoicesFailure(this.message);
}
