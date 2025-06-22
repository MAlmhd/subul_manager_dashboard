import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/entities/comanies_and_clients_entity/companies_and_clients_entity.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/use_case/show_companies_and_clients_use_case/show_companies_and_clients_use_case.dart';

part 'show_companies_and_clients_state.dart';

class ShowCompaniesAndClientsCubit extends Cubit<ShowCompaniesAndClientsState> {
  ShowCompaniesAndClientsCubit(this.showCompaniesAndClientsUseCase)
    : super(ShowCompaniesAndClientsInitial());

  final ShowCompaniesAndClientsUseCase showCompaniesAndClientsUseCase;

  Future<void> showCompaniesAndClients() async {
    emit(ShowCompaniesAndClientsLoading());

    var result = await showCompaniesAndClientsUseCase.call();
    result.fold(
      (failure) {
        emit(ShowCompaniesAndClientsFailure(failure.message));
      },
      (success) {
        emit(ShowCompaniesAndClientsSuccess(success));
      },
    );
  }
}
