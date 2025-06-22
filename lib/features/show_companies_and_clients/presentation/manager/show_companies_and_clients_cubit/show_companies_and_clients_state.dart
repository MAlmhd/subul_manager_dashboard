part of 'show_companies_and_clients_cubit.dart';

sealed class ShowCompaniesAndClientsState extends Equatable {
  const ShowCompaniesAndClientsState();

  @override
  List<Object> get props => [];
}

final class ShowCompaniesAndClientsInitial
    extends ShowCompaniesAndClientsState {}

final class ShowCompaniesAndClientsFailure
    extends ShowCompaniesAndClientsState {
  final String message;

  const ShowCompaniesAndClientsFailure(this.message);
}

final class ShowCompaniesAndClientsLoading
    extends ShowCompaniesAndClientsState {}

final class ShowCompaniesAndClientsSuccess
    extends ShowCompaniesAndClientsState {
  final List<CompaniesAndClientsEntity> companiesAndClients;

  const ShowCompaniesAndClientsSuccess(this.companiesAndClients);
}
